Received: from hedgehog.birch.relay.mailchannels.net (hedgehog.birch.relay.mailchannels.net [23.83.209.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C594F2DC76A
	for <spacemit@lists.linux.dev>; Wed,  1 Apr 2026 22:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080927; cv=pass; b=Khuhza8WOnck7mz9nnxA7AwaUUYKPTE49KB3oiW3rKhWIFfrfyx3Ir/EXkMe66WuD74YGXq6bGdeVWDzgKgKDv0qHSJBkaYVq1+cQPAC+5MTDOaoZOsJPYzF28wdN2mPQ1jL26hGmIdhAw/VBQ84HsQfDvi8iC2BVuUE4Ih+ehM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080927; c=relaxed/simple;
	bh=YDphsqbzDq00gEyEI+EjT+0jZfGAf+jwqxt7NXMBS6E=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=ttbooB6OBrNotL0aIkpWlDSK6+JMpc8Bs7SZoOjx/SuOSSh4CmAs2ootFHce+i7w7743Rd3XnCHurLipHXwzbD8k77Z64E0/Cqh7fXMJG80cjw0h+Gi5I7rJT2ujd6tqF2ky5tmVKDY9chkRnqRpu6XQMpMrL1CgkiokoWxBqsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=iM5+0XMp; arc=pass smtp.client-ip=23.83.209.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="iM5+0XMp"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CF5594C22D1;
	Wed, 01 Apr 2026 21:06:43 +0000 (UTC)
Received: from fr-int-smtpout30.hostinger.io (trex-green-0.trex.outbound.svc.cluster.local [100.98.67.68])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id D381D4C318F;
	Wed, 01 Apr 2026 21:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775077603;
	b=VA/PL+V8L4E2bCyG9SOLTRJY7f8deP5Q9MtcokcpTZyzBuYLZFbLCbcphn23R1y7AwhB4n
	XpZM7k4DXgPbbEgQkcLO5JPf6YmJ3CcxXvMwy4OkElCVNWaVIWg9H3P83ws1wcpmnny12p
	nzSlCimcY6KAoOiqVoFXhhgdxC+Ln5FUBxjNLe3n50F/IexkdhEAqkAp4PMOq9oxc6dwcJ
	DCC+Ctm9VdPc0QC3X3jj3nIGzPL8OZieQQRUqIpkOwJqqSo5sWT88zdckZQPwMJwLoiJdb
	K//psJ6GS4Dt/95x7PDP4aDdcih4FaDYuJgCXBMnR7rpUuhdnWiatgyjuD5rIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775077603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=NWOt+A5DoBbZU4MDhyWwRpo5TFnWZBhqa/iD6NJpi2M=;
	b=vjSe0P3ATitWVh3zaKgpceIee35SUakQfAwXf6Pzre61aIrWsPbMTI12OCUaObJK17l7fd
	xmBUdyswAyQ8ARCEm3ZsWEuho1DCoQwX2vsgu8eDhSNP9JvQsJBDmF1jGXAGBPb39lMOPv
	vbaj6psAhOHDHtFiZCYk8WNvsvWebd+qQrsULUTVQFYO722Bg2kaxnFJjDkQdnDTNMJZSH
	YX2/8tmsRJU7ur2BGRuVRJnQCsg+eU22KmLNY1No8L5vmsNM1K5P37cRJ6nqkTKShFLDUa
	A48DOW0ja25SOhCOxEcRWx8+Gv6+pYQLKZCSkrC1GqfV/03bgK7zP4ywjwDh5w==
ARC-Authentication-Results: i=1;
	rspamd-bd48b9d95-5bmzq;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Coil-Exultant: 77a73e0363d089c2_1775077603610_3843726031
X-MC-Loop-Signature: 1775077603610:1334320305
X-MC-Ingress-Time: 1775077603610
Received: from fr-int-smtpout30.hostinger.io (fr-int-smtpout30.hostinger.io
 [148.222.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.67.68 (trex/7.1.5);
	Wed, 01 Apr 2026 21:06:43 +0000
Received: from [IPV6:2001:861:4450:d360:e8fa:1ded:d686:98f3] (unknown [IPv6:2001:861:4450:d360:e8fa:1ded:d686:98f3])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fmHbf0jwcz364N;
	Wed,  1 Apr 2026 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1775077599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NWOt+A5DoBbZU4MDhyWwRpo5TFnWZBhqa/iD6NJpi2M=;
	b=iM5+0XMph5QpjN/3nMVL4m1lV1Oxrs4W7+KpXmossgzN+u+aVQW8uzg/D6Z9i7vjDFAbNo
	Jl2tlWxBkGOgL3Mp5ZQkbrTEG1eQffBHRdHyPe7ucIyPSaE9hwKC6TQ/YnaI/1YAFX3cLY
	/8dSrB4JM+Rej6jo+j1gJ4rsLNQ/LPIabcHTqZaT/230hY9jbT+Oci27dklGIvOJdjpS3R
	BbosmM0jS5dv4WhMm/O1bd2WF14r4xqOP9GGtg9stc+F3zZY0FppM0iq5TQJqGj2/fRXHh
	oioktSASh5ZBhjOIbP9NA8oOYvNPmg/0LLxqF30dNelnHJ2qGHKHQM9htg815g==
Message-ID: <f6b0b867-c37f-47da-b04a-f8bc88727f1a@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on
 OrangePi RV2
To: Han Gao <gaohan@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Chukun Pan <amadeus@jmu.edu.cn>
References: <cover.1774974017.git.gaohan@iscas.ac.cn>
 <0ec229e2fb138092672773f134d0739e70740ce0.1774974017.git.gaohan@iscas.ac.cn>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <0ec229e2fb138092672773f134d0739e70740ce0.1774974017.git.gaohan@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed,  1 Apr 2026 21:06:37 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ZbRPNdVA c=1 sm=1 tr=0 ts=69cd88df a=E2FlaUaLzEUwfBssy7un6A==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=N2QTJkzpoG2ymMjQJkQA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfHLB0AFcx0PJZBSV6rZVLaebVYPolfbqqKGbNYeNloUgp6yCDdSlkpPugBc+2qmnfW7J3R45ET7ti5Af7QAza8Js7sNxc1uKI3vbG55g49j8DCmG9V5P J5t27P1WsJQwxtpEyRs+Uqjxrw4iHhuijYNA78GS3b8h2a13qNSw6txERabWudbiGhgKsRGXUU5g6icQkAhV2mqNyLrOGllZqrr7/0LJsRhgWl+xMhJYNfN1 rVlp4/2aqnMiD3oUu113NK0yulz762PqAWX3uLc2oXE3kKPzZe2vE8aj2wk8J6tnYiqzoLBUfMQopQi2tJbUg6OAFLUnrqG52LLQ2JamGaHQnwv6ui4KR2DA wBvMG54Ci0frLbtnpv82l1ydz4FIwYIP0uDR/wGtKNpm80q6N5Fjp9YhaV2E03n8bdjT90QsRSvt+r1tMV2xKcH318++IyhKNOWwvuMKaPoCzvMUI3kALO0s BYqj/oSF/ncW9z0tD2NDDkdPtHXk6KBVlYxjI1cTxq/b26Wa9xA5gDl2/xc1wS/Zz200bkNtQdVcng3uLzEeJAPN+rV2RU0ISgJ04qkyJepteYXANaofBsjo TnOOjnqi7/r3lhki8C8GNqEM9Ac/AOriPOvy8HKn+aEz/ysb7ZQb1EDqOeauvdCmUfpXpgSArhkdvEYg3d1Q5dZSFrYTPv5x8B48cjIe2Ag5TzRXMMJHsmth QRBFbkTkCK0B0W3Dupu2DY+JJZzNrMLPyQNGvcMFY+FHP+pcgt9i5pFMCq4Aqm9LIrm7JiFWBdF0NpICtH/5XLYveayr1ntZ
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Han

On 3/31/26 6:27 PM, Han Gao wrote:
> Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
> OrangePi RV2 board.
>
> The board utilizes a Genesys Logic GL3523 USB3.0 hub.
>
> Define a 3.3v fixed voltage regulator for PCIe and enable PCIe and
> PHY-related Device Tree nodes for the OrangePi RV2.

Fantastic! On OrangePi RV2 "lsusb" shows the USB3 host:

# lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 05e3:0610 Genesys Logic, Inc. Hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 002: ID 05e3:0620 Genesys Logic, Inc. GL3523 Hub

I haven't been able to access devices yet, but I guess I'm missing some 
kernel modules....

And on PCIe, I could read the contents of a Raspberry Pi SSD disk:# dd 
if=/dev/nvme0n1 of=/dev/null status=progress bs=4M
255730909184 bytes (256 GB, 238 GiB) copied, 664 s, 385 MB/s
61049+1 records in
61049+1 records out
256060514304 bytes (256 GB, 238 GiB) copied, 672.782 s, 381 MB/s

The SSD was freaking hot though :}

Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
I'm excited to have these features in the mainline kernel, hopefully soon.
Thanks again,
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com

