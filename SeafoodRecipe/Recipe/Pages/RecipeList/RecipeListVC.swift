//
//  RecipeListVC.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 25/05/22.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class RecipeListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var recipeCollectionData: [RecipeList] = []
    let viewModel = RecipeViewModel(useCase: RecipeUseCase())
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Seafood Recipes"
        setupTableView()
        bindViewModel()
    }
    
    func bindViewModel() {
        let input = RecipeViewModel.Input(
            didLoadTrigger: .just(())
        )
        
        let output = viewModel.tranform(input: input)
        
        output.recipes
            .drive(onNext: { [weak self] recipes in
                self?.recipeCollectionData = recipes
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        output.error
            .drive(onNext: { [weak self] error in
                print("error:", error)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "RecipeListCell", bundle: nil), forCellReuseIdentifier: "RecipeListCell")
    }
}

extension RecipeListVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeCollectionData.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mealId = recipeCollectionData[indexPath.row].recipeId
        print(mealId)
        navigationController?.pushViewController(RecipeDetailVC(mealId: mealId), animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeListCell", for: indexPath as IndexPath) as! RecipeListCell
        let recipes = recipeCollectionData[indexPath.row]
        cell.recipeName.text = recipes.recipeName
        let imageUrl = URL(string: recipes.recipeImageUrl)
        cell.recipeImage.kf.setImage(with: imageUrl)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
