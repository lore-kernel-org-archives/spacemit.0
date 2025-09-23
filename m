Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E7D19DFA2
	for <spacemit@lists.linux.dev>; Tue, 23 Sep 2025 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758592939; cv=none; b=fRPfEhXaErM67Mflut0RWW21h7c94dG/4rQY3x70m6GwUAmNYTJdH9NnnRFx+wtimbbr5dbEVdzCzAdv1GMeJLnNjrlrEthsqyyEUHBM6crh2VWrXa7npJua3FBTrom2gTyE6bfZg+T8ZILYy67CcouW6nsdtqiH3rB1txTnRCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758592939; c=relaxed/simple;
	bh=xi/tAHjSbJBoYA4aGt5jM49ClyVBHuelxMuqQ+nqf+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpJJV0zE9aWaT6v1BNOSZTc30UMvewDkb5LovQQ6ttureNadcmldMNaF0rUeOXhJ8SqjUQAJoTcdhYXoA3RWjfMCcVhGgytTD/ky0mkRJuuHLF2GzoKwANYDGNAKs4T/qtg/5i9sugEt7vtrZTrg5gPgj/4KvOGXNwJUoATqq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ivn9tQyd; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ivn9tQyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758592841;
	bh=MEAuKrwM6KdwR90xbDZhYiFbRD7stRJVqn5Ua3qlyBs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ivn9tQydLf/OpeMt8xGn3J6lK0YLp+iCelSjUPO0ApHZDndGNAV1JFapZyjCUKnoh
	 8H/o8PWE11M/y5W+SHKW7+s17ZufXuIYBH+nv4oC2eLvm6adVL+fwWkYG/+P6mvRk2
	 sVV5LRpBgO+RSlKwwLL0KaJxkKQFrZdIaaHXtT8A=
X-QQ-mid: zesmtpgz8t1758592839t273fee33
X-QQ-Originating-IP: GzXckMxXGTPsUWDBYYMmo0syLdSfJ5174o/VNKjj6ck=
Received: from = ( [14.123.255.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 10:00:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12168466649984093045
EX-QQ-RecipientCnt: 14
Date: Tue, 23 Sep 2025 10:00:38 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <6CF6078CFA2EB2F4+aNH_RmNkM_hnsAYu@LT-Guozexi>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-3-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921210237.943370-3-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OVFdYp27KdlJW5P1i9N85qCgmbbqSwGFn2kOiYlbrRc6HfxrE39J2U2j
	qp9TBzVCz7B988NSl83HMVD84Cmp+ZA8PT60tNyyMsRp6aACMN8Gdd58JlsvWLNccaAJ4MI
	WVbZB3oJ6NrpkeyqvLWu/CnWYPlJl75hSx99FlCRlkySqxLUzkRUuYq20qVGbj9pCz4vTa6
	v9NmAlmko30L9GGGHVzvtIrXNlBUgODm0NpS9w1E5G4aN0rg5QQ+Cj3ra891gSjziot6ed9
	uBzHxRXOz4sH6l09R9dnBsOXJ+JwLrDpAexYBDgTX1GlAUeX6pqLqPimjwiiVdH7f8eGhNF
	YU9AxZtbhsGPgJbqppW0NjrKYt6vW5CtZnyflJgd4x3PTOzftV94JQlel2deAeOYRbv1mQe
	6heyQaypxHXIsIm/vMg+rAAolPFDlHvo58NpYR4Q6RAtQKEPCqrKxCz7ngyh+XhiWviW8zr
	YRSZRU84VOnrd9T9HbDt7lQSNiSCOjUTp2Nqts4Ts1lvXxBn6gPwMiCetSZF4Agx3BVOu89
	yEEQ3kVNwMl6OS21ePconhJdiJKZEXFh+e5dpD2LV7ftZOQ76dpmqUbEr1h8Ll7bpBPVTuC
	p/C6JEroS2SUI1VyNyDvi16cUNxpQiNhwvXjyHC8nYAxmJgCvgS2k37N+rB8cfpzJ0gvyKo
	FhVknGxMyF9YHtbUgH4u4tvGEVeA1RtzZRpAdhAEGA+/a2JYOwtGzh+6h9MhR/X4s7TNn3R
	RlO4qwss0xROymYv+T5t16rqKATs9SFRsgugR3WvONK2oa8dqdiVPpxQ/DcCe15LworseRq
	5scYmYEw4aZZlzcBvXzxVaRnV+o6qb9OvgE9jUsFxTIfiFUmkqqTuZL2Dp6SC1+OMSvVFCA
	V21ed7r/xcZh46EP9L7N3VFkgM9ZZpOutGTHicfSIL0iAwjGBAwTM1Oj5r+APDg1XOT2Npq
	1M9BeLP1LNEhm/uqT2l2hCq6+DCxnb2pIkRrf+JMXQtj1RC9s6lZr4/LBQg+jA/ima2xJ3M
	05cpzFAE5n/mi6h3I6npcc9HYiBsQ2MWuhUE6+MhbXQVDbCLcFAIIXqY66je/8O1MEtJbFN
	eRJQKidzvTDzNaaGtd8rLJsiJbIg+Ag3mGk9P32n7eTiLoCrfvLudk=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Sun, Sep 21, 2025 at 11:01:42PM +0200, Aurelien Jarno wrote:
> The BPI-F3 contains a 24c02 eeprom, that contains among other things the
> MAC addresses of the two network interfaces. For this reason, mark it as
> read-only.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 3b6e4f52e9aad..574d10fdf9b82 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -115,6 +115,15 @@ &i2c2 {
>  	pinctrl-0 = <&i2c2_0_cfg>;
>  	pinctrl-names = "default";
>  	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		vcc-supply = <&vcc1v8_sys>;
> +		pagesize = <16>;
I'm not sure this is 16..
Could you double check it?

                - Troy
> +		read-only;
> +		size = <256>;
> +	};
>  };
>  
>  &i2c8 {
> @@ -143,7 +152,7 @@ buck2 {
>  				regulator-always-on;
>  			};
>  
> -			buck3 {
> +			vcc1v8_sys: buck3 {
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-ramp-delay = <5000>;
> -- 
> 2.47.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
