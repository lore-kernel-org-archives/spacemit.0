Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E2E2857C7
	for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759033694; cv=none; b=hk81rWkhRUxRW66FLtcmmfjhCXjcA4qKRrFpffLBMqQjMZ7joxC0ONgXnmvu//uA7rgiPWs6e/Pl55NPvSexawWfkYB7BZKVWNajkjxxe5S2faMSqmstIaihlrEhpZvFN+WLNj5aHB2DvjU1/CJXnHDKg0v7ej6fLcXsJ64YfOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759033694; c=relaxed/simple;
	bh=rLTkZRi3rnk+A3ETcZqBlNg11IGKyfUPUP4yA3M8kcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmmNWHHU54MPZupK4VrUS/kYhWNS/aPp4NI2hiDDPk1xfeOhlpnNE+7lSeRaWnDC5Lq3MUMoGKnEENeHhOpaeI+eGb94df2o+Vyd0AnNyJo+TMi30SVu72fHYFVpzk5y7icathjQIA3Gz4z1heILO4x2MMKHcGkdcVNiISdslHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=cgPbMU41; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="cgPbMU41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759033583;
	bh=lRXKPu9rVdBrwq+A6fNuFBqeLF0wYvpKYrnWz46wPHc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=cgPbMU41hTLA3px7baAVox+J/6l/ceEdMMcYEQxmCKtQ/5rjxjDpTLgtYEGL9GtIb
	 p1JgkTR30DJgs0C/bZ6wZzngB+RNUGa1ncTUMl+uybWLU1yIU4MRomyck/hnCMfd3l
	 qQe/WD4QxsHgWng9v7hCdVeUfLMjLo82PGqxNrQw=
X-QQ-mid: zesmtpgz6t1759033580tdb211f7f
X-QQ-Originating-IP: cTWBXFkZ8w5X/RkyEMnZiFBP1OpMPA6Kf2dcxAHh1mA=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 12:26:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 914358563765765743
EX-QQ-RecipientCnt: 15
Date: Sun, 28 Sep 2025 12:26:19 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Message-ID: <C16FB37F0982124F+aNi46yQc_e-gCIvL@kernel.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MSjOaOtrDtXuk1xHFtM6YLERmB6iSGyxoboZ33IG3agdkWXVoIQ8Lz2I
	UysFx2ZHOWaYAbB7yqydJfVE/Ctw0aITSl8bbAhjCPbFZURQcvBMJJACzybwRnz1YnJcGEg
	p0J+cyvl8ATbxSqT02z20p+aiifi2lj1z5rjg6rluSX0ZjMAvDDqgICDlBUnca3meI0q84Z
	QSosrvuuIjgEqqy8PeqT5lLpEg+OVrEBByN/mnh/gDbzqmY8e02Z01tWvRvdN5g2o+QMJz8
	N8b1uX+2MgTCskZ9qIOk/hXOlXpv30fdzp+N9XMZ9Ayv2dq220zI+jnIgQycIMj9923Y2Mz
	ZQBQddQ/mGVoMk2NaPcQkOKZ6MTEE7QRrbpQrCpYmIyW/FI3v5m3kh9Hp4NkVFrB7Y7tzIz
	ipcxdAwl4eyB9cYvQ9pnXzk2NinHV1JGQImZTa9YhmQ51aCJjJEvl72p/KZbyb4IUksVSgA
	YLaTNzXHnKzMl2B0T26SChexpyjHSzYjR8Fr22qa2Ba4ep5G8f2PSw9wgm5qh3kLxGVIHt6
	XCog9DmNx3tZSLe0cA8AcEQPW6aq2rwnoWzNCfSXf6PKTeG93Dr0imx1HAIDPOsyZlDeNMC
	Pe3oEx3Bqy/piD0I7cv94wQDZA2nDfFnPfgiat7K4750k5Pt0M3CXW6TX//2A/78mPh4nAZ
	loh0l5O/zyC80EdvG3I6d0WFjLuqXzEwDWHlKL4JQkX/rD6aR/0y4I1SeGdA1JgXaOkyyHr
	MSvczhMqqEMRN+E6VuWa5N9Fz9Dew0l1qVDmC5Jnd16EBWtfpxlloIYE3qnTr3/LtHDkEGQ
	p1hXFesO4Nceps0FP6niRNO/ZOpgjciWbcswa9ye7ycyQzYQ53qRsudKUdCgxl8Gr6w14gU
	xut+gm3q4l65KFCFFcFNE7d3Rvdyr2TEKybhO682sSmRU4xi+YUZQ6fDUlZsi53tcieEjtV
	CnYt3i1bOmme/4rkGS+BUDACLchS7l/F+0QwmxlaQUgzYE0cI0fEyKnBafdxb4QrQ6HMB19
	UDk9vKDdBLuHPKm2M6BhGZZCC8yuPcOIg7po9El/wnRCdB+GhZaAbmBx6JJmc=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On Sun, Sep 28, 2025 at 12:16:48PM +0800, Troy Mitchell wrote:
> From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
My SMTP client messed up,
and both 1/2 and 2/2 were sent from the wrong email address.

                                         - Troy
