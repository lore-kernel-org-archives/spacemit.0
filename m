Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BC71B4F1F
	for <spacemit@lists.linux.dev>; Thu,  9 Oct 2025 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997257; cv=none; b=LNBFoR/acwtjBxTZU98VWgVuo2hgVWqqI8U7pCyG6plRb5Nt6MFngM9O1IztNDjFnoyBUFkpF7KCLPnMPts1eb50sjNCO9tkriCzhAomu6DPkKlQyZuB3h2GZH3oYSjkzSwOcxCz/8ri98SVXfsPrejNGNyLq7K5nZbW/G4Afz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997257; c=relaxed/simple;
	bh=DKsNxhZuvjGgb7iyN4foc8ZS/xGsFnmU8aui+Jb/OlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sov3RjzJVY8V0X1FFF+djC0AK0FHCqyYR1/WsdvSQ6tpZRDjnFLmo8WIgK0RTq4NM5kPkxja+ddwh2Jm4pi8+GsavMF89h7x4Prxka6MnVDyFHCyEpdIusu4SerAIUnauahyN89vsJfj3QSKnP2kXp69urFfkgdMmgT3KMxphKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=WiaOkJNj; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="WiaOkJNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759997231;
	bh=QomI1gNvaUojwqQoknXFY7m4GYm6zxoKTgnI/BnC6LY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=WiaOkJNjAfaOxrrDPIS7pnBdL6f1nW9gDe0qY/RG0qlJd/MbAJ27jdS+34kgOUmRl
	 gLVV9BZ4jBbW5badASFhVDHnU+USXqRKFu6uWqYBeENV2WNIY+urgKjT5maAFk8SS4
	 iRy9cmlmZ+J6TV6nHE6bjlgrhoE/uTu+lpJ8a6U4=
X-QQ-mid: zesmtpsz8t1759997228t014935b9
X-QQ-Originating-IP: 3K5W0OLDLhEJGiGik9gi2j2qEwUpKM2FSNoCg+xeMgg=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Oct 2025 16:07:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2621622551196741310
EX-QQ-RecipientCnt: 16
Date: Thu, 9 Oct 2025 16:07:06 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Message-ID: <A5845378AE731404+aOdtKmFPaYfc2n7n@kernel.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
 <20250928074914-GYA1344940@gentoo.org>
 <20250929-challenge-molecular-947bb1f5962b@spud>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929-challenge-molecular-947bb1f5962b@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Mp6z4bZjgTSTBwMUNg8zA9wVxazGdIn93I9Zu21FdJDVa3RXuD+vQjXh
	HHdxaylN9cjOmrQ/WgbLFNFtWLqcn08nuxMpo9RxJR3NopPzZUNsZdRr/08pXyUJ6GMpky9
	IfLW2D13rw7HxB9e1LGPf987k/TreNIwYE6R7en00JWSp1rnbXxeUYfGiKV9gUJz38tjZAK
	kVCx8+/y3vXwr5EsoI+L5M1qqyHVsUAehlvLVThtrWFem6sXUgwFTgWoJOS8yEwcRrRm2Eu
	5xnNR+EMSuhVE1/IqJmEEGv4JPi34oniOGdlInUE4dDUEQCzdin0EBpmNFZyFJ+2pcoMDlr
	ztDKM87TqqndgJzwD6zP7ZKNH46XcumRbtTdSm8AlV45iuUgL48zPpn0mARgzhacWDrRZLs
	WcmSolLIF95e7Y02al/G6q0S9RClEdsnTOG1UhYvkCLECMNWWhYNLq543+Zd1jmz6Ygu1nB
	2w7hZrJiaDUVsahIr6ufnvr4xLZEYwsDLDEFblCHCLxXloVHLQaHib3ZaLY9khPiHZ+zVux
	VGchYJ3bpMPzBEXafYNgnGcipSA55Y8qrSGaMp2s0EJjoJSG8TEPWnDi3FWUcGII63HViBm
	RaURwpJHmXGDZIxfqUwU/Yoeq2QYpSoBGXt1sE/a2rfltAY3uUYLJFXznjdHQOY67PtdM64
	tJY2dzS7czbY12eZIOeXaN6HUBXkwoVHX4NELTic2Qqmln3vReQECz1qydVkfRQolZMeNOR
	j3CsR/RUVbDxYQ3zhjEY8dhhh7coqluyK7qO0O4WL0vXznJuq8PCMFctXHKSOwVUhD+1g6V
	YPo55Mz7KO5VtZuomMD7cGFsuSqTeApa+C91VJfkFaXpDzVAM5oL4qGOvuhCuWB8beKvZFs
	qpd0dWanYd0adsyTgO17UvE0/1KZNcf7cPyA9jIEu1l4wtvKT4L76Al6Jbsx7jYeAvKfQ7M
	Adf7CFBMRBTvACRg6C8nqJUI+UZWpncN7H1SpEVkV8U6md+q7tlv1zfs7tiSX68Wv4eXiWl
	ngPxh/xy4WfGQd19YCwznKLnCAdZo1KP37zgtBPmUZ1iB1GXuz7v245KXLKSEts0gVK5x3J
	6N4GfVqoVZvcjNrGeRi7iY=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Mon, Sep 29, 2025 at 06:48:22PM +0100, Conor Dooley wrote:
> On Sun, Sep 28, 2025 at 03:49:14PM +0800, Yixun Lan wrote:
> > Hi Troy,
> > 
> > On 12:16 Sun 28 Sep     , Troy Mitchell wrote:
> > > From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > 
> > > Document the compatible string for the MusePi Pro [1].
> > > It is a 1.8-inch single board computer based on the
> > > SpacemiT K1/M1 RISC-V SoC [2].
> > you could wrap at slightly more characters, I remember 72 chars
> > (haven't spent time to find a formal document link..)
> > 
> > > 
> > > Link:
> > > https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
> > I'd suggest to list core features of this board, while using this link as a complement,
> > base on previous experience, vendor may change the link address, thus the link vanish
> 
> The link doesn't even work for me.
Could you double check if it really doesn't work now?

> Is this board actually made by spacemit as a developer platform?
Yes.

                    - Troy
