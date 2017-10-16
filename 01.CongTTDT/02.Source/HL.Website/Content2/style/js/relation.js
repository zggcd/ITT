 function mRelational_Init_Paramter()
{
    var arr= $('input[id*="relationIds"]')[0].value.split(',');
    j=arr.length;
    for(i=0;i<40;i++)
    {
        if(i<j) mRelation_Item_Ids[i]=arr[i]; else mRelation_Item_Ids[i]=0;
    }
    arr= $('input[id*="relationTitles"]')[0].value.split('|');
    j=arr.length;
    for(i=0;i<40;i++)
    {
        if(i<j) mRelation_Item_Titles[i]=arr[i]; else mRelation_Item_Titles[i]='0';
    }
	mRelational_Item_View();
}
function mRelational_Item_Insert(i,n)
{
   r=true;
   for(j=0;j<40;j++)
   {
        if(mRelation_Item_Ids[j]==i)
        {
            r=false;break;
        }
   }
    if(r)
    {
	    for(j=0;j<40;j++)
	    {
	        if(mRelation_Item_Ids[j]==0)
	        {
	            mRelation_Item_Ids[j]=i;mRelation_Item_Titles[j]=n;
	            break;
	        }
	    }
    	mRelational_Item_View();
    }
}
function mRelational_Item_View()
{
    var j='';
    for(i=0;i<40;i++)
    {
        if(mRelation_Item_Ids[i]!=0)
        j+='<tr><td class="a01" width="600"><img src="/style/images/right.png" border="0"> '+mRelation_Item_Titles[i]+'    <img src="/style/images/delete.png" style="cursor:pointer" onclick="mRelation_Item_Remove('+i+')"></td></tr>';
    }

    if(j.length>0)
    {
        document.getElementById('mRelationContent').innerHTML='<table class="datagrid_small" align="right">'+j+'</table>';
    }
    else document.getElementById('mRelationContent').innerHTML='';
	 $('input[id*="relationIds"]')[0].value=mRelation_Item_Ids.join(',');
	 $('input[id*="relationTitles"]')[0].value=mRelation_Item_Titles.join('|');
}
function mRelation_Item_Move(p)
{
    if((p>0) && (mRelation_Item_Ids[p]!=0))
    {
        id=mRelation_Item_Ids[p-1];ti=mRelation_Item_Titles[p-1];
        mRelation_Item_Ids[p-1]=mRelation_Item_Ids[p];mRelation_Item_Titles[p-1]=mRelation_Item_Titles[p];
        mRelation_Item_Ids[p]=id;mRelation_Item_Titles[p]=ti;
        mRelational_Item_View();
    }
}
function mRelation_Item_Remove(p)
{
    mRelation_Item_Ids[p]=0;mRelation_Item_Titles[p]='';mRelational_Item_View();
}
function wOpen(i)
{
 	 my_window=window.open(i,'_approval','width=1000,height=500,status=no,toolbar=no,location=no,menubar=no,directories=no,resizable=yes,scrollbars=yes,left=1000,top=0');
}
function wClose(i)
{
 	 if(false == my_window.closed) 
	 {
	    my_window.close ();
	 }
}



