{{if $item.comment_firstcollapsed}}
<div class="hide-comments-outer">
	<span id="hide-comments-total-{{$item.id}}" class="hide-comments-total">{{$item.num_comments}}</span> <span id="hide-comments-{{$item.id}}" class="hide-comments fakelink" onclick="showHideComments({{$item.id}});">{{$item.hide_text}}</span>
</div>
<div id="collapsed-comments-{{$item.id}}" class="collapsed-comments" style="display: none;">
{{/if}}
	<div id="thread-wrapper-{{$item.id}}" class="thread-wrapper {{$item.toplevel}}">
		<a name="{{$item.id}}" ></a>
		<div class="wall-item-outside-wrapper {{$item.indent}}{{$item.previewing}}{{if $item.owner_url}} wallwall{{/if}}" id="wall-item-outside-wrapper-{{$item.id}}" >
			<div class="wall-item-content-wrapper {{$item.indent}}" id="wall-item-content-wrapper-{{$item.id}}" style="clear:both;">
				<div class="wall-item-info{{if $item.owner_url}} wallwall{{/if}}" id="wall-item-info-{{$item.id}}" >
					<div class="wall-item-photo-wrapper{{if $item.owner_url}} wwfrom{{/if}}" id="wall-item-photo-wrapper-{{$item.id}}">
						<a href="{{$item.profile_url}}" title="{{$item.linktitle}}" class="wall-item-photo-link" id="wall-item-photo-link-{{$item.id}}"><img src="{{$item.thumb}}" class="wall-item-photo{{$item.sparkle}}" id="wall-item-photo-{{$item.id}}" alt="{{$item.name}}" /></a>
					</div>
					<div class="wall-item-photo-end" style="clear:both"></div>
					<div class="wall-item-tools">
						<div class="wall-item-tools-right btn-group">
							{{if $item.like}}
							<button type="button" class="btn btn-default btn-sm" onclick="dolike({{$item.id}},'like'); return false">
								<i class="icon-thumbs-up-alt" title="{{$item.like.0}}"></i>
							</button>
							{{/if}}
							{{if $item.dislike}}
							<button type="button" class="btn btn-default btn-sm" onclick="dolike({{$item.id}},'dislike'); return false">
								<i class="icon-thumbs-down-alt" title="{{$item.dislike.0}}"></i>
							</button>
							{{/if}}
							<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" id="wall-item-menu-{{$item.id}}">
								<i class="icon-caret-down"></i>
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="wall-item-menu-{{$item.id}}">
								{{if $item.share}}
								<li role="presentation"><a role="menuitem" href="#" onclick="jotShare({{$item.id}}); return false"><i class="icon-retweet" title="{{$item.share.0}}"></i> {{$item.share.0}}</a></li>
								{{/if}}
								{{if $item.plink}}
								<li role="presentation"><a role="menuitem" href="{{$item.plink.href}}" title="{{$item.plink.title}}" ><i class="icon-external-link"></i> {{$item.plink.title}}</a></li>
								{{/if}}
								{{if $item.edpost}}
								<li role="presentation"><a role="menuitem" href="{{$item.edpost.0}}" title="{{$item.edpost.1}}"><i class="editpost icon-pencil"></i> {{$item.edpost.1}}</a></li>
								{{/if}}
								{{if $item.tagger}}
								<li role="presentation"><a role="menuitem" href="#"  onclick="itemTag({{$item.id}}); return false;"><i id="tagger-{{$item.id}}" class="icon-tag" title="{{$item.tagger.tagit}}"></i> {{$item.tagger.tagit}}</a></li>
								{{/if}}
								{{if $item.filer}}
								<li role="presentation"><a role="menuitem" href="#" onclick="itemFiler({{$item.id}}); return false;"><i id="filer-{{$item.id}}" class="icon-folder-open" title="{{$item.filer}}"></i> {{$item.filer}}</a></li>
								{{/if}}
								{{if $item.bookmark}}
								<li role="presentation"><a role="menuitem" href="#" onclick="itemBookmark({{$item.id}}); return false;"><i id="bookmarker-{{$item.id}}" class="icon-bookmark" title="{{$item.bookmark}}"></i> {{$item.bookmark}}</a></li>
								{{/if}}
								{{if $item.star}}
								<li role="presentation"><a role="menuitem" href="#" onclick="dostar({{$item.id}}); return false;"><i id="starred-{{$item.id}}" class="icon-star {{$item.star.isstarred}}" title="{{$item.star.toggle}}"></i> {{$item.star.toggle}}</a></li>
								{{/if}}
								{{if $item.item_photo_menu}}
								<li role="presentation" class="divider"></li>
								{{$item.item_photo_menu}}
								{{/if}}
								{{if $item.drop.dropping}}
								<li role="presentation" class="divider"></li>
								<li role="presentation"><a role="menuitem" href="item/drop/{{$item.id}}" onclick="return confirmDelete();" title="{{$item.drop.delete}}" ><i class="icon-remove"></i> {{$item.drop.delete}}</a></li>
								{{/if}}
							</ul>
						</div>
						<div id="like-rotator-{{$item.id}}" class="like-rotator"></div>
					</div>
				</div>
				{{if $item.title}}
				<div class="wall-item-title" id="wall-item-title-{{$item.id}}"><h3>{{$item.title}}</h3></div>
				{{/if}}
				{{if $item.lock}}
				<div class="wall-item-lock dropdown">
					<i class="icon-lock lockview dropdown-toggle" data-toggle="dropdown" title="{{$item.lock}}" onclick="lockview(event,{{$item.id}});" ></i><ul id="panel-{{$item.id}}" class="lockview-panel dropdown-menu"></ul>&nbsp;
				</div>
				{{/if}}
				<div class="wall-item-author">
					<a href="{{$item.profile_url}}" title="{{$item.linktitle}}" class="wall-item-name-link"><span class="wall-item-name{{$item.sparkle}}" id="wall-item-name-{{$item.id}}" >{{$item.name}}</span></a>{{if $item.owner_url}}&nbsp;{{$item.via}}&nbsp;<a href="{{$item.owner_url}}" title="{{$item.olinktitle}}" class="wall-item-name-link"><span class="wall-item-name{{$item.osparkle}}" id="wall-item-ownername-{{$item.id}}">{{$item.owner_name}}</span></a>{{/if}}
				</div>
				<div class="wall-item-ago"  id="wall-item-ago-{{$item.id}}">
					{{if $item.verified}}<i class="icon-ok" title="{{$item.verified}}"></i>&nbsp;{{/if}}{{if $item.location}}<span class="wall-item-location" id="wall-item-location-{{$item.id}}">{{$item.location}},&nbsp;</span>{{/if}}<span class="autotime" title="{{$item.isotime}}">{{$item.localtime}}{{if $item.editedtime}}&nbsp;{{$item.editedtime}}{{/if}}{{if $item.expiretime}}&nbsp;{{$item.expiretime}}{{/if}}</span>{{if $item.app}}<span class="item.app">{{$item.str_app}}</span>{{/if}}
				</div>
				<div class="wall-item-likes" id="wall-item-likes-{{$item.id}}">
					{{if $item.like_count}}
						<i class="icon-thumbs-up-alt" title="Likes"></i>
						{{if $item.like_count == 1}}
							<span>{{$item.like_list[0]}} likes this</span>
						{{elseif $item.like_count == 2}}
							<span>{{$item.like_list[0]}} and {{$item.like_list[1]}} like this</span>
						{{else}}
							<span>{{$item.like_count}} people like this</span>
						{{/if}}
					{{/if}}
					{{if $item.dislike_count}}
						<i class="icon-thumbs-down-alt" title="Dislikes"></i>
						{{if $item.dislike_count == 1}}
							<span>{{$item.dislike_list[0]}} dislikes this</span>
						{{elseif $item.dislike_count == 2}}
							<span>{{$item.dislike_list[0]}} and {{$item.dislike_list[1]}} dislike this</span>
						{{else}}
							<span>{{$item.dislike_count}} people dislike this</span>
						{{/if}}
					{{/if}}
				</div>
				<div class="wall-item-content" id="wall-item-content-{{$item.id}}">
					<div class="wall-item-title-end"></div>
					<div class="wall-item-body" id="wall-item-body-{{$item.id}}" >
						{{$item.body}}
						{{if $item.tags}}
						<div class="body-tag">
						{{foreach $item.tags as $tag}}
							<span class='tag'>{{$tag}}</span>
						{{/foreach}}
						</div>
						{{/if}}
						{{if $item.has_cats}}
						<div class="categorytags">
							<span>{{$item.txt_cats}} {{foreach $item.categories as $cat}}{{$cat.name}} <a href="{{$cat.removeurl}}" title="{{$remove}}">[{{$remove}}]</a> {{if $cat.last}}{{else}}, {{/if}}{{/foreach}}
						</div>
						{{/if}}
							{{if $item.has_folders}}
						<div class="filesavetags">
							<span>{{$item.txt_folders}} {{foreach $item.folders as $cat}}{{$cat.name}} <a href="{{$cat.removeurl}}" title="{{$remove}}">[{{$remove}}]</a> {{if $cat.last}}{{else}}, {{/if}}{{/foreach}}
						</div>
						{{/if}}
					</div>
				</div>
				{{* we dont' use this do we?
				{{if $item.drop.pagedrop}}
				<input type="checkbox" onclick="checkboxhighlight(this);" title="{{$item.drop.select}}" class="item-select" name="itemselected[]" value="{{$item.id}}" />
				{{/if}}
				*}}
				<div class="clear"></div>
			</div>
			<div class="wall-item-wrapper-end"></div>
			<div class="wall-item-outside-wrapper-end {{$item.indent}}" ></div>
		</div>
		{{if $item.toplevel}}
		{{foreach $item.children as $child}}
			{{include file="{{$child.template}}" item=$child}}
		{{/foreach}}
		{{/if}}
		{{if $item.comment}}
		<div class="wall-item-comment-wrapper" >
			{{$item.comment}}
		</div>
		{{/if}}
		<div class="wall-item-border-bottom" ></div>
	</div>
{{if $item.comment_lastcollapsed}}
</div>
{{/if}}