Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC96C382F0D
	for <spacemit@lists.linux.dev>; Fri, 22 May 2026 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440674; cv=none; b=iwmSjCj+Cm5sKZrvgybNWh4eFGWLh4Wz+mOv0Pb+NTXmVQdWo7RjtmEDoXGKpmGiwT4X+mqK44ulYlqYHDwQ5E8jKqO3674GVF1El+oHRt4iz3Hz4Sp4JlmcwnEk1OatsPgJmwZTLHaGH+Ns2RLScohNY4T6vJsH0quT/jObIm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440674; c=relaxed/simple;
	bh=GmpQyCnwSi3HeTaUflvNba8/clR0PQ0pY+xm4O82Ykc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9A3PKeqE5ZV1LI1qcUjY8OzhpZnhSpQzPKTRxKmo7+YCUU1MrxhBV9CZbSRxHwCYuUeaDYx2pjMeXUEJzajbmk7gMHzkQQP9anu9VCNmP8Hfz3PsqEeMHI0Tnfl2Cg6204uGfzINWOR69s/Dl3HNf4LwVtGPbQj0KdUKfoB1Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.fr; spf=pass smtp.mailfrom=online.fr; arc=none smtp.client-ip=212.27.42.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=online.fr
Received: from [10.0.0.2] (unknown [82.65.243.93])
	(Authenticated sender: legoll@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 85DA65FFAA;
	Fri, 22 May 2026 11:04:08 +0200 (CEST)
Message-ID: <a1e63aaa-1069-4308-931c-8140774d87e0@online.fr>
Date: Fri, 22 May 2026 11:04:08 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: set console baud rate on OrangePi
 RV2
To: Jennifer Berringer <jberring@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520111150.3300707-1-jberring@redhat.com>
Content-Language: en-US
From: Vincent Legoll <legoll@online.fr>
In-Reply-To: <20260520111150.3300707-1-jberring@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Jennifer,

On 5/20/26 13:11, Jennifer Berringer wrote:
> Set the baud rate to 115200, matching what is used by U-Boot on this
> platform so that the console is usable even when console options are not
> specified in cmdline.
>
> Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
> Signed-off-by: Jennifer Berringer <jberring@redhat.com>
> ---
>   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 7c49bce427f30..07dbd292eee33 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -22,7 +22,7 @@ aliases {
>   	};
>   
>   	chosen {
> -		stdout-path = "serial0";
> +		stdout-path = "serial0:115200n8";
>   	};
>   
>   	pcie_vcc3v3: regulator-pcie-vcc3v3 {
>
> base-commit: e2518e8cb1dde64af2d1bb246639bb7ef7523f7a

I did the same patch, a few days ago, and tested it OK, but did not have 
time to do a proper submission.

So, if it's useful, you can add my:

Tested-by: Vincent Legoll <legoll@online.fr>

Regards

