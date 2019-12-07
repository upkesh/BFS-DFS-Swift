import UIKit

//Copy and paste this file in the playground swift
//Implemented DFS, BFS with Graph

//MARK:- Creating queue for the implementation of BFS
struct Queue<T> {
    var list:[T]
    
    mutating func push(data:T)  {
        list.append(data)
    }
    
    mutating func pop() -> Any {
        if list.isEmpty {
            return -1
        }else {
            return list.removeFirst()
        }
    }
}

//MARK:- Creating Stack for the implementation of DFS
struct Stack<T> {
    var list:[T]
    
    mutating func push(data:T)  {
        list.append(data)
    }
    
    mutating func pop() -> Any {
        if list.isEmpty {
            return -1
        }else {
            return list.removeLast()
        }
    }
}


class Graph {
    var vertices:Int? = -1
    var list = [[Int]]()
    
    init() {
        for index in 0...3 {
            list.append([index])
        }
    }
    
    func addEdge(vertex: Int, width: Int) {
        list[vertex].append(width)
    }
    
    func printEdges() {
        for item in list {
            print(item)
        }
    }
    
    func bfs(start:Int) {
        var visited = [Int:Bool]()
        
        for index in 0...3 {
            visited[index] = false
        }
        
        var queue = Queue(list: [])
        queue.push(data: start)
        visited[start] = true
        
        while !queue.list.isEmpty {
            let s = queue.pop()
            print("\(s), ")
            
            for item in list[s as! Int] {
                if visited[item] == false {
                    visited[item] = true
                    queue.push(data: item)
                }
            }
        }
        
    }
    
    func dfs(start:Int) {
        var visited = [Int:Bool]()
        
        for index in 0...3 {
            visited[index] = false
        }
        
        var stack = Stack(list: [])
        stack.push(data: start)
        visited[start] = true
        
        while !stack.list.isEmpty {
            let s = stack.pop()
            print("\(s), ")
            
            for item in list[s as! Int] {
                if visited[item] == false {
                    visited[item] = true
                    stack.push(data: item)
                }
            }
        }
    }
}

var graph = Graph()
graph.addEdge(vertex: 0, width: 1)
graph.addEdge(vertex: 0, width: 2)
graph.addEdge(vertex: 1, width: 2)
graph.addEdge(vertex: 2, width: 0)
graph.addEdge(vertex: 2, width: 3)
graph.addEdge(vertex: 3, width: 3)

graph.printEdges()
//graph.bfs(start: 3)
graph.dfs(start: 3)

