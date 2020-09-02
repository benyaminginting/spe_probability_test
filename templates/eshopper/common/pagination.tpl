<div class="pagination-area">
{if $statuspagination==1}
<ul class='pagination'>
	{if $InfoArray.CURRENT_PAGE !=1}
     <li><a class='pageposition' href='?page=1{$url_tambahan}'  title='First Page'>&laquo; First</a></li>
    {/if}
    
	{if $InfoArray.PREV_PAGE}
      <li><a class='pageposition' href='?page={$InfoArray.PREV_PAGE}{$url_tambahan}' title='Previous Page'>&laquo; Previous</a></li>
    {/if}

   {section name=ke loop=$InfoArray.PAGE_NUMBERS}
        {if $InfoArray.CURRENT_PAGE == $InfoArray.PAGE_NUMBERS[ke]}
         <li><a class='number active'>{$InfoArray.PAGE_NUMBERS[ke]} </a></li>
        {else}
         <li><a class='number' href='?page={$InfoArray.PAGE_NUMBERS[ke]}{$url_tambahan}'>  {$InfoArray.PAGE_NUMBERS[ke]} </a></li>
        {/if}
   {/section}
   
         {if $InfoArray.NEXT_PAGE}
         <li><a  class='pageposition' href='?page={$InfoArray.NEXT_PAGE}{$url_tambahan}' title='Next Page'>Next &raquo;</a></li>
 		 {/if}
         
   {if $InfoArray.CURRENT_PAGE != $InfoArray.TOTAL_PAGES && $InfoArray.TOTAL_PAGES <> ""}
         <li><a  class='pageposition' href='?page={$InfoArray.TOTAL_PAGES}{$url_tambahan}'   title='Last Page'> Last &raquo; </a></li>
	 
   {/if}
   </ul>
   <div class="clear"></div>
{/if}
</div>