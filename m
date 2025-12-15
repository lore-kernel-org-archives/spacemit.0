Received: from mail98.out.titan.email (mail98.out.titan.email [54.147.227.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AE43375A6
	for <spacemit@lists.linux.dev>; Mon, 15 Dec 2025 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.147.227.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802805; cv=none; b=mfWhRP/ZoJV6KY7diEBFMvAWvIHaLI6NN8YCUSrMTFH3+a9NHozreb5WLckZavEU9QSAQ90iPES4XIdmk/xX07pgtJ64WkaFJCbPn0rWVWDF/R70SV7ss4tsFKFG05AunQmODBKqVLHwyAv3oNGDH5L2tsCFmrj15WHrMlnQLug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802805; c=relaxed/simple;
	bh=d4oaM1nXziqrtjZ78QF3wbkxrqndj2nhEwjcvkyTFhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C72/Um+oCJ5mcSxbR54RvbohN2T/HnIUuflWfFE06J7/ifrkYMARU28aCdxXTgPimQDJkk1lAecNsQ34WK80R+FH4/VLbcO4VUPm+HR0byMNQOMv7cF7w4fE3fcGr1QbmzUyl8pWOaVF4+p085lK6kSmE7OITDDNF+ci+LkOVW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b=Ce2/7dv/; arc=none smtp.client-ip=54.147.227.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b="Ce2/7dv/"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dVKZ42WQ9z9ryp;
	Mon, 15 Dec 2025 12:46:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=26gKZ8cHJQyg3tsQnLKxfy/czi/WwVFDnMPNQEmK7DE=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=message-id:mime-version:to:cc:subject:in-reply-to:date:from:references:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765802796; v=1;
	b=Ce2/7dv/i4glBqnOluWyICUzbXC9PY0zJek9gZOj5/Gq0rOXsZGlvQ/qXY1FBrXoSsn6OQoe
	ysTC1SneZ/ijWRuV6tTgWTsaC9nlb6BmkGFN2Bh4wi9H0WeDD6knni0Qw9W0NEDlIJsZJIoQNSo
	eoNHiK8wEola+IhHXLgFtF2Y=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dVKZ04nK2z9s1F;
	Mon, 15 Dec 2025 12:46:32 +0000 (UTC)
Date: Mon, 15 Dec 2025 12:46:19 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MMC support on BPI-F3 and
 OrangePi RV2
Message-ID: <aUADG5c8r0GEN6iP@pie>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765802796147399430.21635.5162492382395939498@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=a8/K9VSF c=1 sm=1 tr=0 ts=6940032c
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10
	a=9nqrEZDV118k6e1QdI8A:9 a=CjuIK1q_8ugA:10 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22

On Mon, Dec 15, 2025 at 10:10:14AM +0000, Michael Opdenacker wrote:
> This introduces a new sdhci0 node and enables it
> for the BananaPI F3 and OrangePi RV2 boards.
> 
> Note that card detect is marked as broken in the driver
> (SDHCI_QUIRK_BROKEN_CARD_DETECTION quirk), therefore removing the card
> while the system is running won't have any effect.

This description looks suspicious: SDHCI_QUIRK_BROKEN_CARD_DETECTION
doesn't break hotplug. It only informs sdhci core to actively poll for
card status, instead of relying on interrupts for status change.

...

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 7818ca4979b6..a5b7d7c8c066 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -987,6 +987,16 @@ emmc: mmc@d4281000 {
>  				interrupts = <101>;
>  				status = "disabled";
>  			};
> +
> +			sdhci0: mmc@d4280000 {
> +				compatible = "spacemit,k1-sdhci";
> +				reg = <0x0 0xd4280000 0x0 0x200>;
> +				clocks = <&syscon_apmu CLK_SDH_AXI>,
> +					 <&syscon_apmu CLK_SDH0>;
> +				clock-names = "core", "io";
> +				interrupts = <99>;
> +				status = "disabled";
> +			};

This node should be probably put before the emmc node, since it comes
with lower address.

Regards,
Yao Zi
