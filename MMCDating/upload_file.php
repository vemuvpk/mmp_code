<?php 
if(isset($_REQUEST['type']) && $_REQUEST['type']=='image')
{
		if(isset($_FILES["file"]['name']) && $_FILES["file"]['name']!='')
		{		$image= $_FILES["file"]['name'];
				$file_size= $_FILES["file"]['size'];
				$info = pathinfo($image);
				$profile_img=time().str_replace(" ","_",$_FILES["file"]['name']);
				//$profile_img=time().$profile_img.".".$info['extension'];
				if($image!="" && $file_size>0)
				{
					$target_path = "upload/profile_image/".$_REQUEST['user_id']."/";
					if (!file_exists($target_path))
					 {
						mkdir($target_path, 0777,true);               
					}
					
					$target_path = $target_path . $_REQUEST['ImageName'];
					$image_path=$target_path;
					move_uploaded_file($_FILES["file"]['tmp_name'], $target_path);
				}		 
		}
		else
		{
			$target_path='';
		}
		echo $image_path;
}
if(isset($_REQUEST['type']) && $_REQUEST['type']=='video')
{
	print_r($_FILES);
		if(isset($_FILES["file"]['name']) && $_FILES["file"]['name']!='')
		{		$image= $_FILES["file"]['name'];
				$file_size= $_FILES["file"]['size'];
				$info = pathinfo($image);
				$profile_video=time().str_replace(" ","_",$_FILES["file"]['name']);
				//$profile_video=time().$profile_img.".".$info['extension'];
				if($image!="" && $file_size>0)
				{
					$target_path = "upload/profile_video/".$_REQUEST['user_id']."/";
					if (!file_exists($target_path))
					 {
						mkdir($target_path, 0777,true);               
					}
					
					$target_path = $target_path . $_REQUEST['VideoName'];
					$video_path=$target_path;
					move_uploaded_file($_FILES["file"]['tmp_name'], $target_path);
				}		 
		}
		else
		{
			$target_path='';
		}
		echo $video_path;
}
?>