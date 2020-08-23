---
title: Thoughts on a new module base
date: 2011-10-12T14:30:43+00:00
url: /2011/10/12/thoughts-on-a-new-module-base/
short-url:
- http://bit.ly/of4SnV
categories:
- LEGO

---
Ri Co Le Go on Flickr has proposed a new module base for Micropolis. (<a href="http://www.flickr.com/photos/ricolego/6232026762" target="_blank">Composite example</a> and <a href="http://www.flickr.com/photos/ricolego/6231507513" target="_blank">Building Instructions</a>)

I started working on a comment on the image with my reactions and analysis and it got really big very quickly, so I decided to move it here instead. Please be sure to look at those links and the associated comments first for better context.

First off, I think it's a really interesting idea and certainly deserves discussion.

I like that it remains compatible with the existing standard and doesn't compromise the depth of the module. Additionally it seems like there would be a lot more possibility of being able to overcome table height differences with only some small modifications.

To elaborate on Dave DuJour's observation about pin usage in TwinLUG, we've pretty much given up on pins in the big layouts for a few different reasons:
<ol>
<li>
Laziness. :-)
</li>
<li>
The size of even our medium layouts means that we almost always run into weight limitations that result in cracked or sheared pins across table edges.
</li>
<li>
These days we have quite a few modules that are larger then 1 block which makes managing the connections much more complicated.
</li>
<li>
Probably most importantly, we find being able to make quick changes by simply lifting a module out to be incredibly useful, especially in convention layouts where people are dropping off new modules at random times and we want to make sure we get good placement for all modules so that you can still see everything.
</li>
</ol>
The proposed change resolves being able to maintain a nice and even layout while still maintaining the ability to make easy changes. The implementation seems fairly straightforward as well since it can use pretty common parts.

However I think my biggest concern is about part count for the base modules. These days my quarter block bases use exactly 14 parts at an average cost of $2.72 per base. (<a href="http://www.cavort.org/wp-content/uploads/2011/10/Micropolis_Module_Base_(Minimal).lxf">LDD File for reference</a>)
<table>
<caption>Minimal Quarter Block Base Cost Breakdown</caption> 

<tr>
<th>
qty
</th>

<th>
Part
</th>

<th>
$per
</th>

<th>
cost
</th>
</tr>

<tr>
<td>
4
</td>

<td>
8&#215;8 Plate
</td>

<td>
$0.20
</td>

<td>
$0.80
</td>
</tr>

<tr>
<td>
2
</td>

<td>
1&#215;16 Technic Brick
</td>

<td>
$0.57
</td>

<td>
$1.14
</td>
</tr>

<tr>
<td>
2
</td>

<td>
1&#215;14 Technic Brick
</td>

<td>
$0.22
</td>

<td>
$0.44
</td>
</tr>

<tr>
<td>
4
</td>

<td>
2&#215;2 Corner Plate
</td>

<td>
$0.03
</td>

<td>
$0.12
</td>
</tr>

<tr>
<td>
1
</td>

<td>
2&#215;16 Plate
</td>

<td>
$0.19
</td>

<td>
$0.19
</td>
</tr>

<tr>
<td>
1
</td>

<td>
2&#215;2 Brick
</td>

<td>
$0.03
</td>

<td>
$0.03
</td>
</tr>

<tr>
<td colspan=3>Total</td> 

<td>
$2.72
</td>
</tr>
</table>
I went ahead and threw together a really quick minimal implementation of the proposed module base and came up with 28 parts at an average cost of $2.28 per base. (<a href="http://www.cavort.org/wp-content/uploads/2011/10/Micropolis_Rico_Base_(Minimal).lxf">LDD File for reference</a>)
<table>
<caption>Minimal Proposed Quarter Block Base Cost Breakdown</caption> 

<tr>
<th>
qty
</th>

<th>
Part
</th>

<th>
$per
</th>

<th>
cost
</th>
</tr>

<tr>
<td>
4
</td>

<td>
8&#215;8 Plate
</td>

<td>
$0.20
</td>

<td>
$0.80
</td>
</tr>

<tr>
<td>
8
</td>

<td>
1&#215;4 Brick
</td>

<td>
$0.04
</td>

<td>
$0.32
</td>
</tr>

<tr>
<td>
4
</td>

<td>
1&#215;6 Brick
</td>

<td>
$0.05
</td>

<td>
$0.20
</td>
</tr>

<tr>
<td>
8
</td>

<td>
2&#215;1 Inverted Slope 45
</td>

<td>
$0.04
</td>

<td>
$0.32
</td>
</tr>

<tr>
<td>
4
</td>

<td>
6&#215;6 Plate
</td>

<td>
$0.16
</td>

<td>
$0.64
</td>
</tr>

<tr>
<td colspan=3>Total</td> 

<td>
$2.28
</td>
</tr>
</table>
That did NOT include the cost of each of the H connectors which I came up with several different permutations for. The most sturdy using two 1&#215;4 Technic Bricks ($0.04) and a 2&#215;2 Modified Brick with 2 pins ($0.03), most common parts using two 1&#215;4 Bricks ($0.04) and one 2&#215;2 Brick ($0.03), and your proposal with four 2&#215;2 Corner Bricks ($0.06). If we used 1&#215;4 Tile ($0.07) on all three of those permutations the average cost comes out to $0.31 per connector. Supplying enough connectors for a large layout could become quite expensive and even for a medium layout could be slightly prohibitive. (<a href="http://www.cavort.org/wp-content/uploads/2011/10/Micropolis_Rico_Connector.lxf">LDD File for reference</a>)

Still, if you figure an average of 2 H Connectors per module that does make the price difference $0.18, which isn't huge for the possible increase in functionality.

However I think the best place that this will be useful, and the best reason for adoption, will be with Bluff modules. There is currently a big issue with assembling Bluff modules and keeping them together plus the common need for support structures underneath standard modules arranged behind Bluff modules. If we included the H Connector (or maybe "Rico Connector"?) in the Bluff standard on the high sides of the module that would go a long way towards resolving a lot of the problems I've had there though not entirely obviating the need for under structure. However since I am in the minority of people working with Bluff modules I doubt that will have much sway with the rest of the community.

As for concerns about this change causing difficulty for using the depth of the module, I do not find that to be a compelling argument. Most modules that make use of the depth of the module do so towards the middle of the module and not towards the edges. The exception I can think of would be Thomas Anderson's Construction Site, but even in that case there is an intact road on one side. So if the implementation of this change involved requiring at least one (or possibly two) connection points I think that would probably be enough.