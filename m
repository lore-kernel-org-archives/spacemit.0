Received: from crab.ash.relay.mailchannels.net (crab.ash.relay.mailchannels.net [23.83.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085FC35979
	for <spacemit@lists.linux.dev>; Mon,  3 Nov 2025 22:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762207599; cv=pass; b=OV9vkn6npnB3r1KGM1LMY7E0gSri0YkQumof37HeM1Sq5yedWRbLTzltVDRYLEYFouNHUrpqTW31vQfHgBn92cq1I7IQ2vC310GeMnPaOrdAN5dfzv7rhIi3T4lZ/HIGP4hKHYxl9QWsV1xRI7lG5cIpXXKFAC2vmuTYDLhc7z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762207599; c=relaxed/simple;
	bh=/6TiArI8CPvw+U+kpiv0iKmlzI3fyhX3s1XP9RGr2TU=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=J8rK62g0MwZ5EU/OZrzvqJn0WzVTkL6Mg2qbWgUyTJVaxhfP2rgIsgEo30+eiICPMUrIUYCQtZd9HGXHWPF8gx99xXsnNgmU9Xus8jllwRCwK+NSqQ6VE3m/u6wa/aBBX+zET9UzEQA5QEJzSpfnEONZM4RSZIRklsHBYfIgFUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=bIcpagrh; arc=pass smtp.client-ip=23.83.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="bIcpagrh"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7FB846C0176;
	Mon, 03 Nov 2025 20:51:15 +0000 (UTC)
Received: from fr-int-smtpout28.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.123.122.56])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5392B6C2A7B;
	Mon, 03 Nov 2025 20:51:14 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762203075; a=rsa-sha256;
	cv=none;
	b=6gtB/XMHsYvO6fP5W2VC98bV7XtfLz4fyXvGKv/NA2qbUozgkreQDgoeskP0VeNZoNy23n
	9+s2SSMfml6vso4KkVFoHukDKtFW54ItaapLoS5W/JSmDHLNnWZeFGZRMTOLpwqtmZ/2dk
	OHuddjbiKI6FvL9vRWiPAHsA1g1w8PsRLc6G9BApfAPHiF4Etdon6ZLSrTynhh77MN4AI6
	cpsVbU5jlRMekI+5Z7jXUo35CJ6VmO5aOnPAkJR3crrL66fVTdw18BV8FjQ238BaZcy1Bh
	w1Xt3lwgVWahNaUrKG67UKTQ1+nOl4r+XBJVJ3QWmBxVMuyHOvP+97oB+wXzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762203075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=BN1E+bNOPGkOUKtyobMs/wo8d2QpDKee5w7CGY8kmTg=;
	b=KyAS/2RrGlKUJDAyndK8IiOHwMRkWUpu1swN2r66uiluT43Kz1ahwXtlAFlmcsSPxgZCMs
	2T0kaFEV1BQ7oGyCP1+M336soHFzOrmG/OuIYkgONzo74cGEzfW4m9zObF6yVFCqYXGD5j
	4ljidXLInq+BMz6z/KAsHhAiWOuRyPvYbMRuCaQd9pK2A9l8DuFllPMqmiuR32EMSh7dxA
	OfLkrpvTBozmkK7/dtMOiEyKrkwgUCbiufS3T0gO8pdspTnowRxRnALTw6f6OlqdOb2SmE
	mHb/SEHtr4iX+ND7BTPmw2hDOc3gNRdengUvqrF0eLigXblSMALhrEzFPC++fA==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-4b6h5;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Attack-Wipe: 291948b0682b543e_1762203075221_2281779579
X-MC-Loop-Signature: 1762203075221:3538348875
X-MC-Ingress-Time: 1762203075221
Received: from fr-int-smtpout28.hostinger.io (fr-int-smtpout28.hostinger.io
 [148.222.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.122.56 (trex/7.1.3);
	Mon, 03 Nov 2025 20:51:15 +0000
Received: from [172.20.71.102] (93-46-206-37.ip109.fastwebnet.it [93.46.206.37])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d0kJb6D9Xz31H7;
	Mon,  3 Nov 2025 20:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762203072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BN1E+bNOPGkOUKtyobMs/wo8d2QpDKee5w7CGY8kmTg=;
	b=bIcpagrhlaVbcXRnoe34HB8DQ6jbKt1FDRu0HVtyp1Ewaq/oDY8elTSJVd2HJr6iKp3t8v
	ufx8mFA8mfRHr5+bfeDcIOHmgGXq8ijTm3D/ie5li7M+scVG/ukKBRAnjQ5X3M7zHOV9wH
	RNKLk0YgHOEmhvu6N4lNUHvB2T2eKvJbBOUEdxiyzAtKewHK/4m8DEPp1gjQXR58qXMTAU
	fjQrpcE3bGkWLFtv2XvmMU756V3KhvZF8bv5D3qWnSSDIeTGR6TKWmJ7M2I0+onxDSoTzK
	jKMWno4hQrjVA/4SeC77gNnBLrbCL2sV1NJjb+o4hbY50ll1NwebFlt8s62BYA==
Message-ID: <40d90aa9-4ab2-4d8c-939d-337e63179515@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
 <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
 <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
 <D8EC2D64D80DFAFE+aQgXCTbGv9o9t9IS@kernel.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <D8EC2D64D80DFAFE+aQgXCTbGv9o9t9IS@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon,  3 Nov 2025 20:51:11 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=690915c0 a=4YLbAjK1KvTCq7jIiv2jOw==:117 a=4YLbAjK1KvTCq7jIiv2jOw==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=ns0OWjIUjD52wNEF5mYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfFNUVeAk1COLrQEIxgkDEsA67G4T0AWfHChZDjJtrd+1qHJfe0zhHlthOtQujIv0302NmhFRhFTjB6FsvhX90WktgrV7gt1wATYTUziJxl21G9/nd79w +wqIJp0EsQHgSzruSS0Gej1zeYYHxEUj0Ug04fSOZPo7X/i9KF8eZvpwYS+Y6etI+oATsGDqSBSjMrp1d4lhbCsN9MmjfN/C4cgaRvrEjTz35UwnGHerYinc PzGV6Xm2bVYdoAtJ6LtPUme8kwrJtOv9Poz/unZMLzJtKdzeTo41kQk3udV2UiJm+Qmuqr3GfvJIPew1RXWUfTOTzsG+9dvvllPKqPKcuyxvBhJCyOCqPeX1 GqCYpK/C
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Troy,

On 11/3/25 03:44, Troy Mitchell wrote:
>>> Unfortunately, these changes are not functional yet on OrangePi RV2, testing
>>> on https://github.com/spacemit-com/linux/commits/k1/dt-for-next
>>>
>>> # i2cdetect -r 2
>>> WARNING! This program can confuse your I2C bus, cause data loss and worse!
>>> I will probe file /dev/i2c-2 using receive byte commands.
>>> I will probe address range 0x08-0x77.
>>> Continue? [Y/n]
>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>> 00:        [  124.675321] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11
>>> err 0x400000
> I recall that the PMIC sometimes reports I2C timeouts.
> Could you please confirm if you’re seeing this issue on your side?
> If so, does it still occur when using my branch?
Unfortunately, I can't try at the moment, not having the board this 
week. I'll be able to test again next week-end. However, I don't 
remember having it with your changes.
Cheers
Michael.
-- 

Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com

