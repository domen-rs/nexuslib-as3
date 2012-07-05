/* Copyright (C) 2011-2012 Malachi Griffie <malachi@nexussays.com>
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
package nexus.vcs.git
{

import by.blooddy.crypto.SHA1;
import flash.utils.*;
import nexus.vcs.git.objects.*;

/**
 * Methods for operating on git repositories
 */
public class GitUtil
{
	//--------------------------------------
	//	CLASS CONSTANTS
	//--------------------------------------
	
	//--------------------------------------
	//	CLASS VARIABLES
	//--------------------------------------
	
	//--------------------------------------
	//	PUBLIC CLASS METHODS
	//--------------------------------------
	
	static public function readSHA1FromStream(bytes:IDataInput):String
	{
		var sha1:String = "";
		var cursor:int = 0;
		while(cursor < 20)
		{
			var val:int = bytes.readUnsignedByte();
			sha1 += (val < 16 ? "0" : "") + val.toString(16);
			++cursor;
		}
		return sha1;
	}
	
	static public function getHexString(bytes:IDataInput):String
	{
		var debug : String = "";
		if(bytes is ByteArray)
		{
			ByteArray(bytes).position = 0;
		}
		var count : int = 1;
		while(bytes.bytesAvailable)
		{
			var byte : int = bytes.readUnsignedByte();
			debug += (byte < 16 ? "0" : "") + byte.toString(16);
			if(count % 2 == 0)
			{
				debug += " ";
			}
			++count;
		}
		return debug;
	}
	
	static public function createObjectByType(type:Object, hash:String, contentBytes:ByteArray, size:int, repo:GitRepository):AbstractGitObject
	{
		var result:AbstractGitObject;
		switch(type)
		{
			case GitObjectTypes.COMMIT:
			case GitObjectTypes.PACK_COMMIT:
				result = new GitCommit(hash, repo);
				break;
			case GitObjectTypes.TREE:
			case GitObjectTypes.PACK_TREE:
				result = new GitTree(hash, repo);
				break;
			case GitObjectTypes.BLOB:
			case GitObjectTypes.PACK_BLOB:
				result = new GitBlob(hash, repo);
				break;
			case GitObjectTypes.TAG:
			case GitObjectTypes.PACK_TAG:
				result = new GitTag(hash, repo);
				break;
			default:
				throw new Error("Unknown or unsupported git object type \"" + type + "\"");
		}
		result.populateContent(contentBytes, size);
		return result;
	}
	
	//--------------------------------------
	//	PRIVATE CLASS METHODS
	//--------------------------------------
	
}

}