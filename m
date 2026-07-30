Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7440759F;
	Thu, 30 Jul 2026 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785410976; cv=none; b=QolfPu3A5nWacDNcNXfBk3qwu337QashnbUhFYDmbkfuHvJ0X4GWqJ0776xx8ZXpAsWRxuhZH6yMU+f8y8t1f3TVYbS/eNByAkMzpUgfEV61SrrAJSDFLVUoZShQwFDtqp3oTgwjGyiuhirySp/5/XsSamiy2wTc+GS+xKYWQtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785410976; c=relaxed/simple;
	bh=H2g4QOv4E8IgtI4WawAx1g8Z9vGYbm2nn5NUM+9iliM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1538d76nIQF72KDcmN9XyjqwwXgAp9mIsxkH0Khy0sdfGV4uYZMUoteSocSFdqfYG/OYr9qMVI98Xj1dO938Z7fxTMGa1zBlsrWvrjeTBKN5kBnwegW6H+JAuQytP0oVxWizCIWZa4Wwy35Sr+M6gk+k0ONJCE1mTCJBJkpzxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkfE1pes; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkfE1pes"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461031F000E9;
	Thu, 30 Jul 2026 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785410975;
	bh=ReYAwfOvi7XoAWmb+MBrm0lABIXnkQqz384e0Z3fGqk=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=AkfE1pesDiVbng8djmIMZ/lxp7mLUFWdjbtvznmNaqUwQ8XyLfv9oiYnb9HUrU3Xy
	 CnT3hSiRIAWQjQxdkKgAUfaPPfeXAgAfllZJn4dwn4c3Clx5tGAGdntqLm5KJ3Ombi
	 fCXdA9davtwmRIm9FpEmKnJLhJ0+c/pHFtdZK23E07Ka6+uAlClH6dvjRvDVp25Qhy
	 2Naj6tWe1++8N2pZJgAerF6v2K5iir4rSuGONK5gDXdELOirqPq+1IMMgxX8XPUnRm
	 BTLPUkMBWeTi8iQZpQna2dhexwga6pD0GvHl2SBppJawKay7PVjxWZOBNEK29RUA3o
	 4XTHt5IMISmlw==
Date: Thu, 30 Jul 2026 11:29:32 +0000
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: Add Milk-V Jupiter board
 (M1)
Message-ID: <20260730112932-GKF77474@kernel.org>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
 <20260729160749.1621415-5-aurelien@aurel32.net>
 <20260730085424-GKK76518@kernel.org>
 <amsj0kK6LtnxRT_J@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amsj0kK6LtnxRT_J@aurel32.net>

Hi Aurelien,

On 12:13 Thu 30 Jul     , Aurelien Jarno wrote:
> Hi Yixun,
> 
> On 2026-07-30 08:54, Yixun Lan wrote:
> > Hi Aurelien, 
> > 
> > 
> > On 18:00 Wed 29 Jul     , Aurelien Jarno wrote:
> > > Add support for the Milk-V Jupiter board with the M1 CPU. The M1 differs
> > > from the K1 only by its package, which provides improved cooling
> > > performance and allows it to run at up to 1.8 GHz instead of 1.6 GHz.
> > > 
> > > Add m1-opp.dtsi to define the 1.8 GHz operating point and the
> > > corresponding core voltage, based on the upstream kernel. Include it
> > > from m1-milkv-jupiter.dts. Raise the maximum buck1 voltage to 1.116V to
> > > match the new operating point.
> > > 
> > While checking the schematics, the buck1,2 provide power supply both
> > for cpu core and AVDD09 domain - check schematics page 9/25 [1]
> > 
> > the R81 is NC, so buck1,2 is actually all power supply, raise voltage will
> > result high risk to damage the chip (overvoltage of AVDD09 domain), so
> 
> Yes, both buck1 and buck2 supply the CPU core. I only raised buck1 here, 
> because it's the only one controlled by the cpu scaling, but in practice 
> I believe that configuring the PMIC as Dual-Phase Mode couple the two 
> regulator at the hardware level and only the first one need to be set. 
> See my analysis there:
> https://lore.kernel.org/spacemit/178402025712.1568061.9223355686030414906.b4-ty@b4/T/#m828e80aaf454606baafbd43e3795089ba397145f
> 
Your anylsis is correct, and that's not the problem I'm talking about..

what I mean is that more than one cumsumers to buck12, where AVDD may not
be able to tolerate high voltage, even vendor can't guarantee to run stably,
vendor kernel enable 1.8GHz as turbo-mode which won't run for long duration.

https://github.com/spacemit-com/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_opp_table.dtsi#L20

 buck1,2 |--> CPU CORE
         |--> AVDD09 (DDR, AFEAP ..)

> But I can indeed raise both values for consistency.
> 
> > a safe strategy would to test if M1 able to run at 1.8G without voltage 
> > change (still at 1.05v)?
> 
> I'll try that, but my guess is that given the vendor kernel raises the 
> voltage to 1.116V, it is actually needed.
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

-- 
Yixun Lan (dlan)
