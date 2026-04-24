Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DAC1D5CC9
	for <spacemit@lists.linux.dev>; Fri, 24 Apr 2026 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777016546; cv=none; b=gfLS/u2d4TSKq1ZI49xwZeVaa4eTB7rSdqVIlMNWd3vaNWaiAqX2QOM1+5m34XM0WG8owkfL+yWyjM9UabyMR4pMhHClnqytOTj/EOH/BdCLB0F4uq0g/ZGvNdPxJYu0KvUbvNifSYjpXMwQBDxACbdwZndhlrtul49g9FUrCK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777016546; c=relaxed/simple;
	bh=QN7KVGFo1BBaETCje+vuDDb7jfacPCDEHCKeQNll9dw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=m6DGWC7IG+1n66/u9Vax/njeOGIWhCSPpHl3LbIcvw6ja8frwESbz+jp51l3Vbsdb2rYfE1UqJlRQ2ML7+Db9JPXq1uGi3Y7A1rm4uT/nmZfuCcFhKD/w2Do+BoCC7hXx1eOC6f89LOy5R0hMPnxwj7I3XzOoTdBCxnoq3G4C/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=zBrreF2k; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="zBrreF2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777016475;
	bh=PyZmHuWfKfnxFQXFKX9eFlxb2Dgp9LXI++/EQXWEc0o=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=zBrreF2knd8Mk0g+cNETAvLG3GrcpD995sxKqqHZwF4WYen5oFxRKAncWMRKAr8o7
	 Y6H96ni1qjWEwULMIWIvzVBtVpB87To1qdOoAJNHtua5iRja5L6GRATKp4gE8DhW6t
	 1wL/4QrKgex7ITyxyGsROoW80TUG8QAv6nYtwK0o=
X-QQ-mid: esmtpsz17t1777016471tb355b527
X-QQ-Originating-IP: I3YscDtf5R4mtzw4gOyfBpObXsnW5epaXi8nhYV/Te0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Apr 2026 15:41:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11335633746206723623
EX-QQ-RecipientCnt: 18
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 15:41:08 +0800
Message-Id: <DI17RJXO783M.HVG11THU3E9T@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Michael
 Opdenacker" <michael.opdenacker@rootcommit.com>, "Alexandre Ghiti"
 <alex@ghiti.fr>, "Guodong Xu" <guodong@riscstar.com>, "Hendrik Hamerlinck"
 <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen" <cyy@cyyself.name>,
 <spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] Add DeepComputing FML13V05 board dts
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N5QhsOwzP0INht7wOnLC8AfmUBAdfueamrZ8tHkDp+y1NEONmgTJ6gl4
	XfNK2H+DKX9TNB2BMYHxcrbd3w8WkoTdHS8sPbEG9bBsh+Sk5XHVD9iugcEzw/Dagoq2aEc
	KkkQ15v9bUFPtV5jHjZAQYP+rkoj5zl+6bW0EAcK74v/whRMzLa0tHwAhCFUPOM9DB2uQ4l
	wGmfQQ26fNUVD9GOJsNj69J0A1ho1BIhJCWGZCmZAu+zJ7WKqJqf4ET/Pnysrdk0eDXgPu7
	mrUAu2hAIOofpeis0UBSUH8YekYvV4lVAtjA/Kw8HWwWv2NzpomiScwuebjtJHiITFssfmY
	s2ZexsrVYOY/YRFc3ZNQ6/LNvdAgQoz511hwRIG81udwyuAUYehqxZSO0wxm5GqtifTF2+5
	gf88pven6IQvWiHswqUjMDjlG9FnVoGVElPNkjrneuKU0te5tY1rjIZzNp9n/62e+5GtDpN
	9xavp29ewO38K/SEGLOQiFo4w/6TzAYVhsekE6JMoXIfCl04Vd4MikhkCNlxfuk1Ka24ZhR
	n9vJwG20IS1bt+06VXfeBMZiPmAUXYguin1tWMTOiz0H5Unlm01kgS6KRCkP3RYPVaC7AdI
	JMqcLZcoWOBtscF6W0boa+r2QruiHMClwzUc91V8OEG8JMVqsh1GZEcyC4gr22MAfEK76AD
	P6HS44ReRuMGd0NJbMmYgFmgtkIf8pQR40Axfka7wQVad7rbGO3sj5tUId/fKav5Ly4Pwaj
	zzg9vaRiAwMtDXWPgFwWlZy/r3BMj5fFzWKFVc2dcH2Ms5N8Z6ahMGcKeeVUGiDjBEFGsRZ
	6NcCjQK9994Wv/oE7W/t/OO/Igw1FftQyMczjXs5cCLylsVIx3prJJP0w8gDY8ONWEzzEe7
	FU5KuTY2NHphKUlNFMLfQ4cEOnhFPKOnFPSfP4fUvDMFoMGhaLTM7Gk0tB/JzIELpSe6WJd
	Nd6khQbX8TpIo1NTLlMjCSxSAl6IKIP2Mvqxh0aIwKle3caXLL4ibO8KfPzexOnWIxh1S/f
	M7gDaI2rxJlaVp5EVV916tpwPO3TfICyyOFyIdEM3b3iogskOvtLQoR9QRdqo=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On Tue Apr 21, 2026 at 2:40 PM CST, Sandie Cao wrote:
> This series updates Device Tree related files to introduce the
> FML13V05 board from DeepComputing, which incorporates a Spacemit
> K3 SoC.  This board is designed for use on the Framework Laptop 13
> Chassis, which has (Framework) SKU FRANHQ0001.
>
> The series is rebased on next-20260420.
>
Thanks.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
