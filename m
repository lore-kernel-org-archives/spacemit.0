Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B862D192B;
	Tue, 23 Dec 2025 17:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511890; cv=none; b=TuoNzcRqt0ExKFiFOs1BlgTHGsLtZIJm7xhWZkXWgjPCNUo5RTltb5fa3a1Q037IjjvyDvAekl5AWCRNLC3n5XVt+RP9QlxTItNTuK4GI2QDEUWHqKvoMC1rs3Hi/mUvgO/tky+0r41TrYhmzbxD8zCzy/ccOjHaZVVKLXgENX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511890; c=relaxed/simple;
	bh=u9s4C03Sf2XKogwbD7mhFLbiulZJk9l/PuE/DfgTUVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZkWMrG+KPHRZrlplqjbEpBH9s41ONQjzpSiorCBxxSU4mTPB6izRc2L3rGwQz99fSbwEnsJkBMiFIUOsTzEqgJEYUamNkVojqbXRpG6seS0qfouBEJDw75H3rreHwvGwbj+3KvU48+dcv6UFHq6dtbPOyknnqsVFPPPJFzrAdJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqI2BwH0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqI2BwH0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FFEC116D0;
	Tue, 23 Dec 2025 17:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511887;
	bh=u9s4C03Sf2XKogwbD7mhFLbiulZJk9l/PuE/DfgTUVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nqI2BwH0sU7SrGT8Feun1SdQnIrOMtoS82VK5TGHE+bHyxzvzGJevsNDBj6Iz//5T
	 XjzpQ/FuDQchSCnvEX4XjhZQlJwr1xK3SXGKs3CIAN0KoRs0nIoALL9h4l7+xCDrAx
	 VQzTZ4TeBPhAFGTbaOJ7UIehh/xbaPEVx3aJJ1bvUI6smkVzZ8uHK1tbE1/+zvx13+
	 HPbQavT1kqbYXV6/A/T0Ot/Zw9XdulPBQuSOHlnDa6ASCDcZhagK0tEU9p5c5ehWyl
	 xaJ1pSTo+2L9mYNGAEkkAzft9RjRwOXV/EIe23CTIwRf6fmC/JDKPgrw50RRxmcU27
	 CDh3MO16zqAug==
From: Vinod Koul <vkoul@kernel.org>
To: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, kishon@kernel.org, Alex Elder <elder@riscstar.com>
Cc: ziyao@disroot.org, aurelien@aurel32.net, johannes@erdfelt.com, 
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
 p.zabel@pengutronix.de, guodong@riscstar.com, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
References: <20251218151235.454997-1-elder@riscstar.com>
Subject: Re: (subset) [PATCH v7 0/5] Introduce SpacemiT K1 PCIe phy support
Message-Id: <176651188218.759340.4259216266995514459.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:14:42 +0530
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 18 Dec 2025 09:12:26 -0600, Alex Elder wrote:
> This series introduces a PHY driver to support PCIe on the SpacemiT K1
> SoC.  The PCIe controller implementation is derived from a Synopsys
> DesignWare PCIe IP.  The PHY driver supports one combination PCIe/USB
> PHY as well as two PCIe-only PHYs.  The combo PHY port uses one PCIe
> lane, and the other two ports each have two lanes.  All PCIe ports
> operate at 5 GT/second.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
      commit: f6194de7df023ecfd5156caf8e2762487be07ef7
[2/5] dt-bindings: phy: spacemit: Introduce PCIe PHY
      commit: 326a278a3682d390269699f68e597b5ef5a57d26
[3/5] phy: spacemit: Introduce PCIe/combo PHY
      commit: 57e920b92724dd568526990c04e79ed54241c5fc

Best regards,
-- 
~Vinod


