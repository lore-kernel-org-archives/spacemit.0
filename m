Received: from va-2-29.ptr.blmpb.com (va-2-29.ptr.blmpb.com [209.127.231.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C03B4EAB
	for <spacemit@lists.linux.dev>; Tue, 31 Mar 2026 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941711; cv=none; b=iD/rGegGYbTCvSu4gNx5y+ybXba+CWwydwg52xTVNL2S1ng3h+mXvTZN0xZ0Bc9J8Qf+GJI2EHPRMwNvVk/LVfxMe1s4BfVqo0OPd+pDCbLjxxBQ32QjtE8+yJtu8Az+IfZPqRPG7xGSlUICfLfbekKx8sQguyA1Mi+ijz51kew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941711; c=relaxed/simple;
	bh=B7oNmP6viNZ6qgD7MgVlD0elZ+Qs3xdqUMng7B/CrDA=;
	h=Date:Message-Id:To:Subject:Mime-Version:In-Reply-To:Cc:From:
	 References:Content-Type; b=DcAc4R0TAzy+1cFPKDcPjqBoXQgbF8sRue5tnF3+GucrDkDPMicW7M5CUitm1yjclneA/yD+xosi4y7ZI2UiM8QumDjS0HCsTxdyM1wfpVbFoKQUgEFuo+FtdxGbNrexdt8ersOQ7zRi3VS/S4YrjbUMXQbUF/99rlylyoKVEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=nUWYE0Fb; arc=none smtp.client-ip=209.127.231.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="nUWYE0Fb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774941704;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=B7oNmP6viNZ6qgD7MgVlD0elZ+Qs3xdqUMng7B/CrDA=;
 b=nUWYE0Fb8mMcLD7dHHiIWIENcW9gXsK4KB+jcnrZqVIiTOc9jZnOsK/zfcUs+UTWe8yyCv
 k+/0Wy7QBxF5QHxB9HJiCyj2Omeuxc+i6sFDMKVeGHiZNiWoRrVHy7+MzoAgdK4lR6kyzJ
 3X5ivjOpe7fvw3ZdnIyKQgXgCGgDW1rNT1j89h1mRA8QsbsjdFhoc6RYlb35kD91FN6UQB
 s6ii9uZZTCoKrxbCGQU1OebeH3jOR/ilYZwOOYLK0ZTBptZnXDc3dFTSHa/6wWF7/7FteM
 PBavoQD9LWxMto8wsflO2QdrBkofLntRsWVDnf2eHvZksfvIhMDjCfCwye/Cfg==
Date: Tue, 31 Mar 2026 15:21:39 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.08d3c83d.aec5.4c10.8292.56d0380e3296@feishu.cn>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2 0/2] Add DeepComputing FML13V05 board dts
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
In-Reply-To: <DHGS6RDFCOIN.14KI92Y8TSNRS@linux.spacemit.com>
X-Lms-Return-Path: <lba+169cb7606+20a3b4+lists.linux.dev+sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: quoted-printable
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Yixun Lan" <dlan@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
From: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>
References: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
	<DHGS6RDFCOIN.14KI92Y8TSNRS@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8


> Hi Sandie,
>=C2=A0
> On Tue Mar 31, 2026 at 3:11 PM CST, Sandie Cao wrote:
> > This series updates Device Tree related files to introduce the
> > FML13V05 board from DeepComputing, which incorporates a Spacemit
> > K3 SoC. =C2=A0This board is designed for use on the Framework Laptop 13
> > Chassis, which has (Framework) SKU FRANHQ0001.
> >
> > The series is based on riscv-dt-for-next.
> >
> > v2:
> > - Patch 1:
> > =C2=A0 =C2=A0Use formal format user name.
> > - Patch 2:
> > =C2=A0 =C2=A0Use formal format user name.
> > =C2=A0 =C2=A0Add Reviewed-by from Troy Mitchell.
> >
> > Link to v1: https://lore.kernel.org/all/20260331034423.67142-1-sandie.c=
ao@deepcomputing.io/
> Please slow down a bit. Sending a v2 immediately after a single review do=
esn't
> give others (especially those in different time zones) a chance to look a=
t v1.
> It's better to wait a day or two to collect more feedback before sending =
a new iteration
>=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 - Troy
>=C2=A0

Got it.=C2=A0
Thanks a lot.
Sandie
