Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C9E26FA7A
	for <spacemit@lists.linux.dev>; Sun, 17 May 2026 10:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012870; cv=none; b=rlwdv6pCbHWj/hlfQh1Weim5mjdW3/F0FSoRbGJVg5kc4zA3KdG85GTAcd5tORNaXsgeDFlltMG8TdFgNyhZJN0ytT8iNj3KtkiXqIZRK1PS4vAb/txn4ab46a2QV/HoO+p8yIakjy8wGSGL+F3dcoP38Q4PV33Zog/HlXgsi3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012870; c=relaxed/simple;
	bh=6NrvqXVuosMUpjJXwInafk0dG7dDARM6azx1SrXBLFI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Yx/8RPURsRruFb8ldhXXOpj7pIiqIb+ntjXcfvvWCEwpfgjGoWtnanR5p13nf2hCsCW4cqLPLWlqLFB71b8gE0klbxzIXFLq40AaN/ltrZ7ceIEq6fbGQZZHDO0TVgDcA7695ugz7cIlJmZ1qTUrqDzUN35NTcencuQhOTkmXaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.fr; spf=pass smtp.mailfrom=online.fr; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=online.fr
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 0B8D4DF8853
	for <spacemit@lists.linux.dev>; Sun, 17 May 2026 12:14:17 +0200 (CEST)
Received: from [10.0.0.2] (unknown [82.65.243.93])
	(Authenticated sender: legoll@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8B6E86013C;
	Sun, 17 May 2026 12:13:54 +0200 (CEST)
Message-ID: <e92fc4a6-7a63-4d24-9c13-8fec3d8184d3@online.fr>
Date: Sun, 17 May 2026 12:13:54 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Yixun Lan <dlan@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 pjw@kernel.org, robh@kernel.org, spacemit@lists.linux.dev
From: Vincent Legoll <legoll@online.fr>
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yixun Lan, Chukun Pan,

I tried spacemit-com/for-next (e2518e8cb1dde64af2d1bb246639bb7ef7523f7a) 
on opi-rv2
which includes this patch.

but cannot see anything relevant to SPI in dmesg, whereas I see [Q]SPI 
in u-boot output, but there it is listed as:
[   0.887] SF: Detected XM25QH128A with page size 256 Bytes, erase size 
64 KiB, total 16 MiB
Which is not the same you tested (XM25QU128C).

Am I missing something ?
How can I know this patch is working properly ?
What should I test ?
What should I report ?
Is this test useful ?

Thanks

