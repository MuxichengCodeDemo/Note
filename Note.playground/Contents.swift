//
//  Note.playground
//
//  Created by heguican on 2018/3/13.
//  Copyright © 2018年 heguican. All rights reserved.
//


//MARK: - 问题点记录
/*
 1.NSOpenPanel
 需求：在画面上添加一个自定义按钮，跳转到一个自定义Window。
 问题点：代码编辑和调试阶段，直接在NSOpenPanel上添加button，可以实现。但是开启沙盒后，代码奔溃
 分析：查阅官方文档（沙盒），在沙盒模式下NSOpenPanel，继承与NSObject类，没有subview，无法直接在上面添加子view。
 解决办法：NSOpenPanel中有一个accessoryView属性，可以在窗口内添加一个自定义的view，
 然后设置isAccessoryViewDisclosed = true
 使得view常显示。把自定义button添加在自定义的accessoryView内即可
 
 2.NSTableHeaderView
 需求：headerView需要在实现拖拽功能的基础上，追加点击headerView排序功能
 问题点：既存代码通过继承NSTableHeaderView，监听鼠标 mouseUp mouseDown mouseDragged事件
 在这种结构中，点击headerView，只会进入mouseUp mouseDown，不会进入sortDescriptorsDidChange
 不重写mouseDown，则能进入sortDescriptorsDidChange，不会进入mouseDragged
 分析：现象上看，鼠标事件的接受者只能有一个。
 解决办法：在调试sortDescriptorsDidChange的过程中，观察了tableView中的一些属性，
 发现tableView.sortDescriptors的规律，然后自己在mouseUp方法中修改
 tableView.sortDescriptors属性，系统会进入sortDescriptorsDidChange方法
 规律：1.点击没有点击过的tableColumn，插入新的sortDescriptor到sortDescriptors[0]
 2.点击已经点击过的，但不是当前选中的，move当前sortDescriptor到sortDescriptors[0]
 3.点击已经点击过的，且当前选中的，取反ascending属性，move当前sortDescriptor到sortDescriptors[0]
 
 */












//MARK: - 随记
/*
 1.macOS App的Menu Item的enAbled控制
 Menu Item有其点击方法menuItemClicked(_:)
 然后重写validateMenuItem方法
 override func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
 guard let action = menuItem.action else { return false }
 switch action {
 // ----- Menu > Item -----
 case #selector(menuItemClicked(_:)):
 return ismenuItemEnable()
 default:
 return true
 }
 }
 
 2.数组的一些接口
 array.filter({ bool }) 返回符合闭包条件的数据
 array.contains(where: { bool }) 返回闭包条件是否满足的Bool值
 array.index(where: { bool }) 返回符合闭包条件的index
 array.reduce(true, {$0 && ($1的条件）}) 返回所有数据计算条件的叠加值
 array.flatMap({ $0 as? 类名 }) 返回符合类名的数据
 array.flatMap({ $0.property }) 返回数组中所有元素的property值的数组
 */
