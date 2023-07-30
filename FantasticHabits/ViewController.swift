//
//  ViewController.swift
//  FantasticHabits
//
//  Created by 도성현 on 2023/07/27.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AddItemViewControllerDelegate {
    
    var habits = [
        "아침 7시에 일어나기",
        "운동가기",
        "영어 회화 공부하기",
        "책 읽기"
    ] // 배열 초기화
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HabitCollectionViewCell", for: indexPath)
        let title = habits[indexPath.item]
        if let cell = cell as? HabitCollectionViewCell{
            cell.titleLabel.text = title
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HabitCollectionViewCell{
            cell.checkboxButton.isSelected.toggle()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? AddItemViewController {
            viewController.delegate = self
        }
        
    }
    
    func itemAdded(title: String) {
        habits.append(title)
        collectionView.reloadData() // 다시 데이터 리로드 시켜서 추가된 항목 읽게하기
    }
    
}


class HabitCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!
}
