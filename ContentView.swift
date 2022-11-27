//
//  ContentView.swift
//  Grind75
//
//  Created by Franklin Le on 11/26/22.
//

import SwiftUI
import WebKit

//Models
struct Array: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let difficulty: String
    let description: String
    let solution: String
}


struct Binary: Identifiable, Hashable {
    var id = UUID()
    let name: String
}

struct ContentView: View {
    let arrays: [Array] = [
        .init(name: "Two Sum", difficulty: "Easy", description: "Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:\n\n\t\u{2022}\t[4,5,6,7,0,1,2] if it was rotated 4 times.\n\t\u{2022}\t[0,1,2,4,5,6,7] if it was rotated 7 times.\n\nNotice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].\n\nGiven the sorted rotated array nums of unique elements, return the minimum element of this array.\nYou must write an algorithm that runs in O(log n) time.", solution: "class Solution:\n    def twoSum(self, nums: List[int], target: int) -> List[int]:\n        hashmap = {}\n        for i in range(len(nums)):\n            answer = target - nums[i]\n            if answer in hashmap:\n                return [i, hashmap[answer]]\n            hashmap[nums[i]] = i"),
        //        .init(name: "Best Time to Buy and Sell Stock", difficulty: "Easy", description: ""),
        //        .init(name: "Contains Duplicate", difficulty: "Easy", description: ""),
        //        .init(name: "Product of Array Except Self", difficulty: "Medium", description: ""),
        //        .init(name: "Maximum Subarray", difficulty: "Medium", description: ""),
        //        .init(name: "Maximum Product Subarray", difficulty: "Medium", description: ""),
        //        .init(name: "Find Minimum in Rotated Sorted Array", difficulty: "Medium", description: ""),
        //        .init(name: "Search in Rotated Sorted Array", difficulty: "Medium", description: ""),
        //        .init(name: "3 Sum", difficulty: "Medium", description: ""),
        //        .init(name: "Container With Most Water", difficulty: "Medium", description: ""),
    ]
    
    let binarys: [Binary] = [
        .init(name: "Sum of Two Integers"),
        .init(name: "Number of 1 Bits"),
        .init(name: "Counting Bits"),
        .init(name: "Missing Number"),
        .init(name: "Reverse Bits")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Arrays") {
                    //                    ForEach(problems.sorted(by: {$0.difficulty < $1.difficulty})) { problem in
                    ForEach(arrays) { array in
                        NavigationLink(array.name,
                                       value: array)
                    }
                }
                Section("Binary") {
                    ForEach(binarys) { binary in
                        NavigationLink(binary.name,
                                       value: binary)
                    }
                }
                
                
                
            }.navigationDestination(for: Array.self) {array in
                VStack (spacing: 10) {
                    Text(array.name)
                    Text(array.description).font(.custom("Lora", size: 13))
                    Text(array.solution).font(.custom("Consolas", size: 13))
                }
                
            }.navigationDestination(for: Binary.self) {binary in
                Text(binary.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
