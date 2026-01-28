Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C3354AD4
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 13:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606950; cv=none; b=HWCcwxuXILxLYeZ65XvA3j1rWNAEKKHd2jFEFdUrQZZdZeR3EgM0cyggSbtuy0zMqkEwDZa4B8MGNJQtpHDDSVvBl42VG7nEqE9JaC4fYtL/t4Jlhs6Ki3OYdwBwiblDIhsxUrkk94xucmUZ3ykdJE7RhXJrYBMKbJoJ8Rg2QIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606950; c=relaxed/simple;
	bh=AwkTB+Y8vc2jpSus7qu1cjCswZPdr3ovkHfH+PLJ0xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cIvAI++Krn8xATL0ofpXCbfRQNYQYvCr6i1tMUF8F+TwQfy1bzyF7u+4RK/fWlI7Ka9sEEIeKsXWyZ03VD43dTJBkdODp7UfYzRUCxp/In4Jnyg2lJxo/l63zigiLBjCv/VBjMNtoE7/2zj3GLchzBHTIrHF/cQieVAl8b742Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zQoCfZIQ; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zQoCfZIQ"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7cfd0f349c4so3961420a34.1
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 05:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769606948; x=1770211748; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=raYtuP2NjeAqA5181HGaACfoUp8/gkl6VSn/CKYueq0=;
        b=zQoCfZIQWpJ9a+ZPSYFAOlZVZRbKa2KJndLcF1HgsjvmlQLKlsyv6/pmJZq/7T22Qb
         ZrTx5NN0hB+m5MLAB41Q2nk54CVdp36KhrQAy23q0MFOAavMmt39c8DprL+zf8ZAb8xd
         pW1wGOhKZ/l20sT5vF+J46P7j/2C3wARy4ZVR/VVjWqm+B/eRPlC7c5A2a47LrUqrN/b
         zVLteSm6kVAN95I5PeoGk/0GXT09tpKuQnIKwrC4T+GawVX779qBkC6xdylS6U6vMuBJ
         fbMn7OYdmiuHjFq4OQ/udDq3UCPboVXlA0pSCDSbc5itoju7gma5RxGDcrGdNx4Fsh7r
         PmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606948; x=1770211748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raYtuP2NjeAqA5181HGaACfoUp8/gkl6VSn/CKYueq0=;
        b=YpZugDHroaVDgbAi6SV6FRodP8s7agE/tsZecuFsUC4JwJ78dIOaMrFE4Khu+8IBxa
         RDFWbSUaqaox7v8E274Pt1FZyPTg+IrMxkB8jTzFN9OIGSi2V9z7v7U2x22NZsSSs/M6
         MXzH2MFtqoDyaFz8OdHkPXW8pE2MBFq/SCzfAceL68d4BXMUAuClA5UwjIMoVcQm6l33
         5uYqn58CYZ4Wf7QP6Gg4ysO8ztx0zbOnTH5kJTroSTQ7xXARteBJ0RYw9ngn4Mes9dpu
         YLOlBnJ6D7iWgOqcoS1xWI0iTFitCJfyCUbRFY45DuGxFKUT3kDwUXqvQc4aBh4URRo7
         cMgg==
X-Forwarded-Encrypted: i=1; AJvYcCX4iK8S/qXfiD6nMjjvKFuDNLxMJYJxGtdPvXAo9LGNgLrp4GyAub/Z8EgjlZqmgnwXH05vjVb40g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqPLusyZNDyu2Hsit8ZyatVJSAZSWz6z69uZb4pMDS/UvRY896
	cwGnRNIUAFSg4BfGZhPSbh3qwzcU6nQoEHpV45k1Mew1SkjZ0D/GuUAvq2JLbDU4uNU=
X-Gm-Gg: AZuq6aKUgY8WEFVFG5NZcvnHw0Z2tQvyewqrqc6mRhW7591ErcMejlZky3P2V4Kpkqw
	x2D8S7N8DZ1yf5xHqizYnWAn8QNNrw5TKJLO4OkAGpddxyRlGhkKHhTozYxWgzth/08sjeEQjGd
	ZReFM/uKdeT3C+fCIhw7KUGatpzmrT1xaYYNnDr37tA6E7ta8WVm4CxdJTalWdpNYWoT/jZJFrw
	z2vUi8TZIvOv2knh+LpeamQNN9Pw/ctRzFxYWWlyD5cqNHd7mMUWsy+tRrY+BXqJCtdeFuSDs9d
	rlFV6qdUcx6tsfR0HWDq+bAUBVPP2R60MrS9qKAyH4JOsMVfWgQX/9fkexbcdewwKLYAyZghjrI
	giuhhGBJBVl4UQ/yZutBhUQ/Qdf2fpQy/ofqKWobiUv3zXXuugIOaWAoSPZR8gVVTVOGOHbUfR+
	NdcurHh5W9479cryYVoicchZEO+46ATpCZPhH5ilxsgoRL8ixifyY=
X-Received: by 2002:a05:6820:4588:b0:65f:1012:69c5 with SMTP id 006d021491bc7-662f20f917fmr2413146eaf.76.1769606943544;
        Wed, 28 Jan 2026 05:29:03 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f994388fsm1374132eaf.4.2026.01.28.05.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:29:03 -0800 (PST)
Message-ID: <7f892961-5978-4283-bec9-0f2953db42b7@riscstar.com>
Date: Wed, 28 Jan 2026 07:29:02 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: Update PMIC supply
 properties for BPI-F3 and Jupiter
To: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-4-2c86b06694ba@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-4-2c86b06694ba@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/26 6:20 PM, Guodong Xu wrote:
> Update individual supply properties in pmic "spacemit,p1" node to specify
> the board's power tree topology for BananaPi F3 and Milk-V Jupiter.
> 
> Previously these relationships were hardcoded in the driver; now they
> are explicitly defined in the devicetree per the updated binding
> document spacemit,p1.yaml.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

I acknowledge that you've made an ABI change, and I should
have done a better job of describing this the first time
around.  (And reviewers might have caught that!)

I had some of the same thoughts about supporting just
"vin_supply" for older systems.

However I agree with the conclusion you and Vivian
came to, which is that practically speaking it isn't
likely to be a problem.  Boards should use either
old DTB and software or new DTB and software, not
a mix.

Reviewed-by: Alex Elder <elder@riscstar.com>


> ---
> v2: Added the pmic supply properties for K1 Milkv Jupiter.
>      Updated the commit message accordingly.
> ---
>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 12 ++++++++++--
>   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 12 ++++++++++--
>   2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 5971605754b3..444c3b1e6f44 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -190,7 +190,15 @@ pmic@41 {
>   		compatible = "spacemit,p1";
>   		reg = <0x41>;
>   		interrupts = <64>;
> -		vin-supply = <&reg_vcc_4v>;
> +		vin1-supply = <&reg_vcc_4v>;
> +		vin2-supply = <&reg_vcc_4v>;
> +		vin3-supply = <&reg_vcc_4v>;
> +		vin4-supply = <&reg_vcc_4v>;
> +		vin5-supply = <&reg_vcc_4v>;
> +		vin6-supply = <&reg_vcc_4v>;
> +		aldoin-supply = <&reg_vcc_4v>;
> +		dldoin1-supply = <&buck5>;
> +		dldoin2-supply = <&buck5>;
>   
>   		regulators {
>   			buck1 {
> @@ -221,7 +229,7 @@ buck4 {
>   				regulator-always-on;
>   			};
>   
> -			buck5 {
> +			buck5: buck5 {
>   				regulator-min-microvolt = <500000>;
>   				regulator-max-microvolt = <3450000>;
>   				regulator-ramp-delay = <5000>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index 800a112d5d70..e2702a781734 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -100,7 +100,15 @@ pmic@41 {
>   		compatible = "spacemit,p1";
>   		reg = <0x41>;
>   		interrupts = <64>;
> -		vin-supply = <&reg_vcc_4v>;
> +		vin1-supply = <&reg_vcc_4v>;
> +		vin2-supply = <&reg_vcc_4v>;
> +		vin3-supply = <&reg_vcc_4v>;
> +		vin4-supply = <&reg_vcc_4v>;
> +		vin5-supply = <&reg_vcc_4v>;
> +		vin6-supply = <&reg_vcc_4v>;
> +		aldoin-supply = <&reg_vcc_4v>;
> +		dldoin1-supply = <&buck5>;
> +		dldoin2-supply = <&buck5>;
>   
>   		regulators {
>   			buck1 {
> @@ -131,7 +139,7 @@ buck4 {
>   				regulator-always-on;
>   			};
>   
> -			buck5 {
> +			buck5: buck5 {
>   				regulator-min-microvolt = <500000>;
>   				regulator-max-microvolt = <3450000>;
>   				regulator-ramp-delay = <5000>;
> 

