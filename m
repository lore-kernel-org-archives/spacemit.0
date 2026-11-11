Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359589;
	b=G/7VE0xEqnWARmp4l9L2Vb8IWUFuxDSce9o3jGok27fBXNRAkvtC4BKEXkO6WHpA0c0+
	 zRAkiNm9EOqjES4IgKnbooQwn3HzzXRSYy2LJVMzOSv4sLqjyzY2O9P1/7OTq4UV/P2RO
	 sSqAtgM4cURweLwXALeRA125WDz2qwALm1PdWlotN7auWw11RvVN2VmdYMgipz4iOFHjZ
	 x6NacgPwyC2AWzV/lJWLe7CJQsV/mWF6Y3EPBTSOiG+4ru9zJPejwDqWVhas3VrK7H7Gl
	 xSezNPxeaX+sucwL6ykCf8i9dLQBSTegzZg0osp4XcTQFLWefVybjcCJQGmx2SyNV5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359589;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=a3XFBWaVL7cZAtmzMb6ZHGk2os0RkwoM4AiUI/2FEuY=;
	b=tGGh0lvhGJjH04ANuKI/4GWMXi9rIaPEkTw9e8UiOiByrByuUTwKtVRUJTxHen8ZBvZV
	 qVUtZ9F4feTmBKYOPz4kqaqBrR3Y6PGG7kei35yohXbqg9+0uRXE3uSQIt208mnNL3BAi
	 xaLKGssGobnXszPPCzAJNdVl6VQ81O+C/gFCZuja6O1HLTsGcfqSplScsWwAB9tcE+43f
	 2gClqoEexsyH3JT9uRRcGoAq1mdFBFZy+E2zUrGd1jDsauEJ85Db+7QLE+7AUwO+jxrEB
	 jWoq9ncAL1P4pbShr1Rbrp/JqDsNe8Rl3Y8bge9GIK+a2EixoWvWgRMuzAEVKVAgeNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SQVTUtzl;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9153606A31C
	for <spacemit@lists.linux.dev>; Wed, 11 Nov 2026 01:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9153606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SQVTUtzl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794359530;
	bh=a3XFBWaVL7cZAtmzMb6ZHGk2os0RkwoM4AiUI/2FEuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=SQVTUtzlwsnquVcK6R0EQ9PTx/fI3wlh/wLCvI9Up2N9IbzQhR2mOjtV7XKCZ+mh3
	 WQv/dRI9x+PAyX4Az6YxTF922HrLZOitXB8E8qH8HA9cnLYd56g59T0czGjpLIxPaA
	 /SrXKUxKP1N1p3UduGwCzyCWG1gqZDtIilDXL9Ek=
X-QQ-mid: zesmtpsz5t1794359529t41b4978e
X-QQ-Originating-IP: ygy4xZLnMdBFlasO8HXKH6PUKGIStAkWKnImD4xzJkY=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Nov 2026 09:12:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11734215651587251840
Message-ID: <47902FCAC1DDFAB2+525255ac-cc05-4a57-bd83-a4a29edcbe01@linux.spacemit.com>
Date: Wed, 11 Nov 2026 09:12:03 +0800
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
To: Aurelien Jarno <aurelien@aurel32.net>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Andy Chiu <tchiu@tenstorrent.com>, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <apSYF5x1Tu7PlyL1@aurel32.net> <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net> <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
 <arSshYwcyHjC2dh3@aurel32.net> <arS-yYLK8Df5knSE@gmail.com>
 <arX7PwOnlz0N9rUc@aurel32.net> <arnt6EEacEm3YRIC@aurel32.net>
 <db540b00-a017-4c82-9a6c-93e862dcde67@iscas.ac.cn>
 <ato_lUcnuZV30Mtj@aurel32.net> <auulITfR8BrabdVF@aurel32.net>
Content-Language: en-US
From: kevin zhang <zhangmeng.kevin@linux.spacemit.com>
In-Reply-To: <auulITfR8BrabdVF@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ngwq0BL9nhqbAtXnitlNnAmS9CIO/2HplAL2O4yC+9hXQYCOFk+2jON6
	zw11CVwY3NUzGpSuWIkrJMEtABGWEUmTem0URCW18ZGefedUO5MgC3zIJwpcbkVCMEwvk5t
	IcDNlUdIOeyUJPtj1KQOyb0HQwFkf4TBY8L2d6Vy7gbJm18TzimhZLUapxH3AomgsqFhCqB
	yIcCNmTPPzARQ+liit/9DzeA2NkSRDVC9rfjms148ZVXuR2iH5dJMoVZx8mEPRCpr+u0lBn
	oKPTES3LEA5wUjp7k8Sr4br0r3G5ByiLN0Wm2cOOmJOX6MeXO8M9ce1os3GW9a0O8uj9Rmo
	vWoQ6ot22wnx20DB2PeuyJphH6Ok+YwskIDJ5a201RQanrG5N92zF/bcZf1PVdi1813+azA
	28US6gWXy/3IGl3bbsSvoBtgzoOvmBo0yWgTIE6+3hI5iXaw/XtDROd/bFxfzJfriFBw6N7
	gmfvgp7yG912sqbb0hc3Hm33i4uRDKc4t8KxGyPipW2RGOGTCvH0eEwKnDcM3CX4d6o1gxZ
	2Fbtb6SLfhmmSH+msUkct6I8lp2diXodffSWnDeYz5d0cpy2stUjAvaeFqPZ/FN62F2E6gx
	ykRxo0Uz5U2NJqUoKYTknaN0/Bj793ULVDqR4dgakcSoluvS/EkbKEx35gsCbNdb8up8ikY
	l5ehrIEs+E/9BGhYFFeAeRmqcRq4fmndq/Lbq7oU+xTaNQF458CFbZFpQ1kxIznzTqAPmbI
	uxEaKvD1+2WEQcRZby8IKiR8nA8++uT8A2u0CfllKO2LTAf4uWIA5qREJGnLXXbbls2ySv8
	kdha5FUGPhK0Bu26SacisUoWJZYCooZzYGG7YyJi4HoPNgbj7twDdMN/G+fdDP5Rj91u+DA
	sv/sVwjXLADvNdovwgTv9gjbgDLOdKLPhjopB6t8kyj/Z/G6fCafuFoVKgpWHUcpTSU8p2T
	scsyLlzVedpPHA81o9DaWHNEJ57LWhCP+59G+R/eXtVW5C/TSwNir3hMa9QYsQYIADgr8iD
	8opONhK7k6TOuAKXBkCPsOBgA1lQEtmTgPk2Z10ag9/Znay3ME
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Hi, Aurelien,

Thank you for your continued efforts.

On 11/5/2026 5:35 AM, Aurelien Jarno wrote:
> Hi,
> 
> I have finally been able to capture the last few exceptions happening
> for one event where the vectored user copy code is corrupting data. That
> was on the SpacemiT K1.
> 
> I added a hook to handle_exception(), activated only when
> __asm_vector_usercopy_sum_enabled is running, and recording CPU state at
> the beginning of the exception, in per-CPU 16-entry tables.
> On the OpenSBI side, I also instrumented sbi_trap_handler() to log the
> CAUSE_MISALIGNED_LOAD and CAUSE_LOAD_ACCESS cases. This only fires
> during the kernel boot when it tries to measure speed of unaligned
> accesses.
> 
> The case I captured was a 4096-byte long copy, from 0x2a883310
> (userland) to 0xffffffd701e54000 (kernel), presumably from a write
> syscall. The copy is considered successful, i.e it exits with a0=0. That
> said after the copy, the source and the destination start to differ
> after the first 16 bytes, at address 0xffffffd701e54010.
> 
> The copy started on CPU 5 and ended on CPU 5, and there was only a
> single exception between the start and the end, so it wasn't
> rescheduled.
> 
> The exception happened with epc=0xffffffff80e09204, which corresponds to
> the location of the "vle8.v v0,(a1)" instruction. I recorded:
> - cause=0xd
> - badaddr=0x2a883410
> - a0=0xffffffd701e54100
> - a1=0x2a883410
> - a2=0xf00
> - vl=0x100
> - vstart=0x0
> - vtype=0xc3
> 
> As you can see, the exception happened during the second iteration of
> the loop. It is not clear to me why the first iteration didn't trigger a
> page fault, as both 0x2a883310 and 0x2a883410 are on the same 4k page. I
> have also logged the content of v0 at the time of the exception, and I
> can clearly see that only the first 16 bytes (out of 32 bytes) got
> loaded during the previous iteration. Its content matches the error
> reported by GNU as on the userland side.
 From the information you provided, the issue does indeed seem quite 
strange. Could you please share your debug patch with me? I'll try to 
further locate and analyze the issue on my side.
> 
> Then the remaining of the loop continued without exception to copy 4096
> bytes in total.
> 
> At this stage, I do not have any other explanation than a CPU bug. That
> said, I have noticed that the problem started when userland started to
> use the vector extension, and with the above, I do not have any
> explanation for the link between the two. I'll try to capture another
> corruption event (it takes ages) to see if it can help refine the
> explanation.
> 
> Regards
> Aurelien
> 
Best Regards,
kevin.z.m


