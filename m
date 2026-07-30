Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AFC3EF0A6;
	Thu, 30 Jul 2026 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406427; cv=none; b=K/OyPxGSZW+KPy/mtl74WbdEiv6zKw2TbBiwE4egIkmJ1vrc+NZMaq9gBY2jYlWx+hF27v+zzUuePuzZjRMU5g7p2vJaM6qP81ceb6M2gTUTfX2/4N/6R31Vh8TGp3fE4640phcXbuWMpRFvgJyvlNt2jDNiKrE3wjsSQmaxafQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406427; c=relaxed/simple;
	bh=3fPdH4J83hXcWz21JyDoqBTU3y/rn1xeDQATlXBfP+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPNCAqt+ou6VQOhVldThSyzDt/H+A8d0MGJGG7rmCqxRKA4VU4hIW/O/adhrWDZY6mCzoqLzdrogMVABraigU8bUgpGoYelSQaK9YzzJLqZnwPUm6bXZsAilAeVL+EkjOAppKPr0hEfzCYryQgqieMLwfSB00GGSFMteTPH4sbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=B7OBgiAc; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="B7OBgiAc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=dWQdDtWejUihFsUBZUvRz7z1CPw3WKWc0VH0sn0ICaA=; b=B7OBgiAc7Xus328CRgIwveVb5z
	/UKeuH9iTvEj22RSqfOMvUJIPTijQKYLEdUklJSNN743n3Dece/9iF2FEjH/5Aju7EFF62vVigDmt
	LoI9fEARdIZzqSDz4v2ExEntOS1X/K/8moBG8I162i4sHRfSWAxPWPnOYEHk4NNSFejGlW6+m3fw+
	WGNU9eHgtv7Vw9866p8EDt8bK8+yIARuqRY+YNDHlkpuaMhM4mwvO/X7Aw5NGVH+Pceulqa/aHJm+
	uqDVd7JjuPvRrb9Sa4xAIChnMKKINfg9gk5mpwA+43q012GrLUwl2ZYeA3SS7Sk3IVEwMOxyhgbcM
	YI7mFZRA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wpNlm-00000003zvy-3Usl;
	Thu, 30 Jul 2026 12:13:42 +0200
Date: Thu, 30 Jul 2026 12:13:38 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: Add Milk-V Jupiter board
 (M1)
Message-ID: <amsj0kK6LtnxRT_J@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
 <20260729160749.1621415-5-aurelien@aurel32.net>
 <20260730085424-GKK76518@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730085424-GKK76518@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi Yixun,

On 2026-07-30 08:54, Yixun Lan wrote:
> Hi Aurelien, 
> 
> 
> On 18:00 Wed 29 Jul     , Aurelien Jarno wrote:
> > Add support for the Milk-V Jupiter board with the M1 CPU. The M1 differs
> > from the K1 only by its package, which provides improved cooling
> > performance and allows it to run at up to 1.8 GHz instead of 1.6 GHz.
> > 
> > Add m1-opp.dtsi to define the 1.8 GHz operating point and the
> > corresponding core voltage, based on the upstream kernel. Include it
> > from m1-milkv-jupiter.dts. Raise the maximum buck1 voltage to 1.116V to
> > match the new operating point.
> > 
> While checking the schematics, the buck1,2 provide power supply both
> for cpu core and AVDD09 domain - check schematics page 9/25 [1]
> 
> the R81 is NC, so buck1,2 is actually all power supply, raise voltage will
> result high risk to damage the chip (overvoltage of AVDD09 domain), so

Yes, both buck1 and buck2 supply the CPU core. I only raised buck1 here, 
because it's the only one controlled by the cpu scaling, but in practice 
I believe that configuring the PMIC as Dual-Phase Mode couple the two 
regulator at the hardware level and only the first one need to be set. 
See my analysis there:
https://lore.kernel.org/spacemit/178402025712.1568061.9223355686030414906.b4-ty@b4/T/#m828e80aaf454606baafbd43e3795089ba397145f

But I can indeed raise both values for consistency.

> a safe strategy would to test if M1 able to run at 1.8G without voltage 
> change (still at 1.05v)?

I'll try that, but my guess is that given the vendor kernel raises the 
voltage to 1.116V, it is actually needed.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
