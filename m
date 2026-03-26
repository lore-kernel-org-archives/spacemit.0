Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231153254A8;
	Thu, 26 Mar 2026 07:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774509248; cv=none; b=PsJ45qkQE9wngiI/EeUNzGraOI/BTXSL8do2n7eEO2zalzvYd2vVbvvHzaJcWIQL1jEgdGi0VcXUovEDquudXFzJfYvQLtoYB4izbtDBKPCghgC9HpDrlm9qYewIvlVkA02dCeHsOH3+9lQ9WDU5d+A2YqZj8nVOqOjeY+G+5iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774509248; c=relaxed/simple;
	bh=j+EykvnW4YLCD4pDE6qCdNMazBf3vURnXvo7Vi+hVa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRFNN6YezY3CcMeaHeTm47nlAI4oz9DkpqSR5sTSQ6vAuvtvgpNQbI3TBI5DV5DwUtw0b4IadQeavpHxPGUsC6YrFx3ZDjyWsbfBiGQ6uAKFqMDPC1zH9oUv8SYVDA2xygNIVQmSpveAyEE0sTMycY8BJ9HZHOg002vIPkySEs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwNMIsAi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwNMIsAi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4913FC116C6;
	Thu, 26 Mar 2026 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774509247;
	bh=j+EykvnW4YLCD4pDE6qCdNMazBf3vURnXvo7Vi+hVa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwNMIsAiDx7Q7afpSnd4E5/mmjr2a7nfRnWoHuiFuw+WeF1QZhVlqTtW8jaSp4XVt
	 bFuSWvLysrvj06IbVqeATkedP2TjUeAofRoJ5n2PXmS8VgXRZDOCakdn9ffeXmeNDz
	 JwWh4YpISLXkoSEyIKi5JlC8kxIi+CwRXc+yuMA5xdERk3mXwrfv8nUknToolK4ZOA
	 ZCeiCv2eS6qcqtE9S9kgVrX8Zvu2BxtR6qXWk/guf0qRg4OvHDdxk1wJHzyK4hn2ox
	 fgH9ucqP5gRo12G2IwjTcUrlXEKZdConH/XG2LNp0UPsuK5Dngl/mqRtjUpiVWxek9
	 KYY41O1dV2X4w==
Date: Thu, 26 Mar 2026 15:14:05 +0800
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: riscv: spacemit: k3: add P1 PMIC regulator tree
Message-ID: <20260326071405-GKE777612@kernel.org>
References: <20260325-02-k3-i2c-v1-1-a793776b88bc@kernel.org>
 <6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org>
 <20260325234835-GKA777612@kernel.org>
 <2d0ef51c-c0c1-4670-9221-e0b62ca75fae@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d0ef51c-c0c1-4670-9221-e0b62ca75fae@kernel.org>

Hi Krzysztof, 

On 08:02 Thu 26 Mar     , Krzysztof Kozlowski wrote:
> On 26/03/2026 00:48, Yixun Lan wrote:
> >>
> >>
> >>> +
> >>> +	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> >>
> >> This is even more pointless because there is no user. Dead code.
> >>
> > reg_aux_vcc3v3 is used by various devices, but I can drop it too,
> 
> Which ones?
To be precise, I should say reg_aux_vcc3v3 will be used by various
devices in future, but not in current device tree of mainline, e.g, 
USB2.0, PCIe, 10G Ethernet, Audio..

-- 
Yixun Lan (dlan)
