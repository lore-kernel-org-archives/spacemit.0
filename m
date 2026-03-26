Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF392FFFA4;
	Thu, 26 Mar 2026 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510499; cv=none; b=Ofn4GDUkRgDeDn9qltgiIRN4qn49JZv/6TEY1q+ly+S4PJvbY2pcsW7WKq8SSOlE3XMLlGfjRgb1+VRWFcAUtpvNZM7E40T/TSUi69fwrjturuV/xJXDJ9LGZV9n0nbLX1mNTKNNFk1jAA1nvKyQaZsTraZIMq4OF6eteeUllqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510499; c=relaxed/simple;
	bh=i9G0GSY9TeIGOxDzdr8Ir22Ps+YtLJcsSy7NDz39L5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEtwc/QZaiw2YteOoY9YXGuY7ef+NEikZHJw5NDEV5DkTrcwx7aKLSQMlVBQNJlDiXPnXeX6uaelJMF0ggs+VF4PVW1foFwJU5x+vBV4eyHm7xS1pUwm497NgrMnUVVv5KczV8EQGrvoc4RW085eR0m0hAPRW20cLPZ7zVgA2KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2EdTM1j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2EdTM1j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF12C116C6;
	Thu, 26 Mar 2026 07:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774510498;
	bh=i9G0GSY9TeIGOxDzdr8Ir22Ps+YtLJcsSy7NDz39L5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2EdTM1jIZcDuLvJ/zWbxKykGQvqYDbXRLb2ZNFKKDdyswvTxeXfZjFOdeDQRileN
	 UL2jfl0J4Gp93lVIy1b34lTV0gvnTUfWZ1Pf8QmaSQzwonocfyPDYfVZGXVVulth7J
	 7fMTY/HIayOAdqw0lIvDkDljMlmRL8A8kHZ/JigGMs1NisYOVrxy/1bw8I150RwUAV
	 EL8J8bhLOSyp2VFp1BJYKdhHNIKzI7kv8qjvdUtN1N4HaPpgejk1wCns4yVj0Nl0IM
	 4X0GYI8RkSNjTJhz/LyCd6Tgr9tZsaL/WPMm95FRfIswRHlJUVJvOxm9C/NqdyOv1D
	 XlsnHt7SCGCag==
Date: Thu, 26 Mar 2026 15:34:56 +0800
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 6/6] riscv: dts: spacemit: enable PCIe ports on Milk-V
 Jupiter
Message-ID: <20260326073456-GKH777612@kernel.org>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-7-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322203356.2206927-7-aurelien@aurel32.net>

Hi Aurelien, 

On 21:28 Sun 22 Mar     , Aurelien Jarno wrote:
> Enable the two PCIe controller along with and their associated PHY. They
> are routed to the M.2 M-key connector and to the the PCIe x8 slot.
                                               ~~~~~~drop one
> 
> Add an always-on regulator sourcing 3.3V from the DC-IN input, to power
> the PCIe ports.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Can you re-spin one more version? along with previous bootph-pre-ram
change, you might also wanna adjust the commit message accordingly..

P.S, It's easy for me to pick from the list instead of amending locally

-- 
Yixun Lan (dlan)
