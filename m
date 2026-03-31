Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0E334CFCF
	for <spacemit@lists.linux.dev>; Tue, 31 Mar 2026 06:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774938303; cv=none; b=X0ezoDhsbfc/M8xAvzVNDEwx52tlr4cHVgsXS66OADu7kMLaKlCmCNBuelfCVSVhKl0SWgY26d5Br4bBzgC86Z3BaV26g0pIRiVG5fiCEUxyFosfd4W08BLsvEThwT4p7wMkUnkt/GJskrY3F3x/0oTgqr9BzFwbbFgYmIAKYfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774938303; c=relaxed/simple;
	bh=j4liDksHwIln5ga25Q1CkKDt6DsbViL8I6wB68SIJRc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YryysRghCCFG278r7AFh61/VZM2JF7wtky/L2OShwwiBloa5x2voTZlrZNRsOui6wzEn4EP3bOBiccu6hQoyM8o/fy2c8a1bx0HknPjQdvnP7iejkkKS0JAHTPO5TiV5NhNEUFEXCin0wN1W1yifxEanvtwdH158dQh5PokVOjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=m2mEQifD; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="m2mEQifD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774938296;
	bh=evd1KGOp3v60RJusgfOWkdX/AzKDwinO9+CXd1sT7bs=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=m2mEQifDey5iUHOi9HgnuG/7FsbddVNDkXRVk89Zjbba2sdnd4CctRIam1ULvHqFw
	 uvnvymhCQspOPXObi0Rq7Dy8Ix3YvYUGHGZvBQgihGEs1sQU8KVFNI0MY+RsOHyv1l
	 C3NnPXGg//nYRXccodVR4FD0sFIAVAB6oiHnqS/0=
X-QQ-mid: esmtpsz11t1774938294tb566c15d
X-QQ-Originating-IP: 0i6M9Z/bUDYoUa/H8znOzdZxa3wvQzHyTrhng4juzec=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 14:24:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13136377230614588610
EX-QQ-RecipientCnt: 19
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 14:24:52 +0800
Message-Id: <DHGR42QJK86L.10IAY9CB3RZH5@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Emil Renner Berthing"
 <kernel@esmil.dk>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Guodong Xu" <guodong@riscstar.com>,
 "Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen"
 <cyy@cyyself.name>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add
 deepcomputing,fml13v05
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>,
 "Yixun Lan" <dlan@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034539.67167-1-sandie.cao@deepcomputing.io>
 <20260331060344-GKA976850@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.d811f619.24b1.431f.ad4d.c0bae1097eb9@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.d811f619.24b1.431f.ad4d.c0bae1097eb9@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M8JnMGwRo1mQEH4NnjmJn5guKePnUWACUadiEDfwPGBdbcX1GH6SouwL
	uvnZ8ZrrPWur4Ovw8QGJDCQIE1+CWMvtbZ3FOKtAJfNP+244jLqjO0LJ4Ox2nxzYiaf/zr7
	LyuXpJC9QrP3VovS3cEhyaYoXnn4IQEIryPIakOYF6tspDMaXRpooeoncLj5ptQjENTMVxV
	0H7Gm5q8EkrauQjmsr3/+01FDl2m1ZLkPkMDSJXqSq/o2JfHODTHxm/l6acx9rszVeST65w
	ZLblVl7dQ7QEhRtn3Ghx/t5Ayo/3yNqIWyvzTYqRJOU/d3IeKLkp85hnMjDwxF7X3dUoV3L
	PufZPmbPUjFaGPTO0nZmwS10+PWdWu7AV9HA9Fx3qUk+bWw7N1U1Qu9TS6U9UqaECPjEPv+
	P+YRki2K3WlNG41Vq4SoVyh83arT5dExqYVty5KB+UDHtzHyzQPoTBuhyiwSZmEb6zA2QGq
	UJ1HpaANLNRaLKU8qy9oTHP7L9L2/t0RdTs6P/VsY9AFR6Joi7vvikuCSsixYySEPdJUIXb
	x4OHFBaR7B9iDxe8OG1uj/0dG6NC4Beb4znbTNP5bNljH7mRtt8xHz/IP4fpAYcdueAw4EP
	+mK/fosJWY3uTOfN94efauKhD22F9l4OCNCgae2TM+nytE45pjoLmSN3W/KowTDwsxQAh92
	FD8L/OrMhV3z4dbDGE+kckNYFk3L+HYKUzK0sogKzTO62ujnUfNjZwr0hY6UxLLMmk701XN
	xcKhKDh4KG1wq+tJOXDvPfAUdPuXs2LbWu2ErOzM+6RsIeht20eqelHUxRRq38wwbATtOj6
	2C/jFgswSo1CTdGa1ZZ4iukAotJVXEjr01J/+IfFtq64I08fBEnoLh14sPlfcOnFZeXb+Wd
	sb0wgrGe3gYelSX5dYpVCu1GrIWa2oX55RGUVxL3LKkqa8LINmg+DxpqsYQBxIKE5RGPn/J
	KNH+boVVRoS3LrmAAtqXJJ10sz3WP3M40BeVfqJ+uHCzHRVyECm52HaNNUs7TYKNS1SntCG
	jDx0dRchQgtgC01hrgM9OPvA1xjQQUW9VEq77Pz03N8wU3L2+f18TNLECRxH8=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Tue Mar 31, 2026 at 2:15 PM CST, =E6=9B=B9=E7=8F=8A=E7=8F=8A wrote:
>
>> From: "Yixun Lan"<dlan@kernel.org>
>> Date:=C2=A0 Tue, Mar 31, 2026, 14:03
>> Subject:=C2=A0 Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add deep=
computing,fml13v05
>> To: "Sandie Cao"<sandie.cao@deepcomputing.io>
>> Cc: "Conor Dooley"<conor+dt@kernel.org>, "Emil Renner Berthing"<kernel@e=
smil.dk>, "Rob Herring"<robh@kernel.org>, "Krzysztof Kozlowski"<krzk+dt@ker=
nel.org>, "Paul Walmsley"<paul.walmsley@sifive.com>, "Palmer Dabbelt"<palme=
r@dabbelt.com>, "Albert Ou"<aou@eecs.berkeley.edu>, "Heinrich Schuchardt"<h=
einrich.schuchardt@canonical.com>, "Troy Mitchell"<troy.mitchell@linux.spac=
emit.com>, "Michael Opdenacker"<michael.opdenacker@rootcommit.com>, "Guodon=
g Xu"<guodong@riscstar.com>, "Hendrik Hamerlinck"<hendrik.hamerlinck@hammer=
net.be>, "Yangyu Chen"<cyy@cyyself.name>, <spacemit@lists.linux.dev>, <linu=
x-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, <linux-kernel@v=
ger.kernel.org>
I'm just confused as to why this appeared in the body.

                          - Troy
