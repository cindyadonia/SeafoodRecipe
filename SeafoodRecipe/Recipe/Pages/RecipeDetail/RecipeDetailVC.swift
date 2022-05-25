//
//  RecipeDetailVC.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 25/05/22.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class RecipeDetailVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var recipeData: [RecipeDetail] = []
    let viewModel: RecipeDetailViewModel
    let disposeBag = DisposeBag()
    
    var components: [RecipeDetailComponent] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(mealId: String) {
        viewModel = RecipeDetailViewModel(useCase: RecipeUseCase(), mealId: mealId)
        super.init(nibName: nil, bundle: nil)
    }
    
    func bindViewModel() {
        let input = RecipeDetailViewModel.Input(
            didLoadTrigger: .just(())
        )
        
        let output = viewModel.tranform(input: input)
        
        output.recipeDetail
            .drive(onNext: { [weak self] recipes in
                self?.components = recipes
            })
            .disposed(by: disposeBag)
        
        output.error
            .drive(onNext: { [weak self] error in
                print("error:", error)
            })
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        tableView.register(UINib(nibName: "SubHeaderCell", bundle: nil), forCellReuseIdentifier: "SubHeaderCell")
        tableView.register(UINib(nibName: "IngridientCell", bundle: nil), forCellReuseIdentifier: "IngridientCell")
        tableView.register(UINib(nibName: "InstructionCell", bundle: nil), forCellReuseIdentifier: "InstructionCell")
    }
}


extension RecipeDetailVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return components.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let component = components[indexPath.item]
        switch component {
        case let .imageCell(url):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
            cell.selectionStyle = .none
            let imageUrl = URL(string: url)
            cell.recipeImage.kf.setImage(with: imageUrl)
            return cell
        case let .headerCell(title, subtitle):
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            cell.selectionStyle = .none
            cell.titleLabel.text = title
            cell.categoryLabel.text = subtitle
            return cell
        case let .subHeaderCell(title):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubHeaderCell", for: indexPath) as! SubHeaderCell
            cell.selectionStyle = .none
            cell.subHeaderLabel.text = title
            return cell
        case let .ingridientCell(label, value):
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngridientCell", for: indexPath) as! IngridientCell
            cell.selectionStyle = .none
            cell.ingridientLabel.text = label
            cell.measureLabel.text = value
            return cell
        case let .instructionCell(description):
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionCell", for: indexPath) as! InstructionCell
            cell.selectionStyle = .none
            cell.instructionLabel.text = description
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let component = components[indexPath.row]
        switch component {
        case .imageCell:
            return 265
        case .headerCell:
            return 50
        case .subHeaderCell:
            return 40
        case .ingridientCell:
            return 30
        case .instructionCell:
            return 450
        }
    }
}
