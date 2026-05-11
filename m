Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFADA2FF147;
	Mon, 11 May 2026 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483241; cv=none; b=qC1QK8/SQgUrKrMHAhUTzrCDHCnBuKgvZ7LioOVJNSDgeuTVnkL/VcCv7s4L4KCoGKcpJNIvRCrf8od3HVW6jdC/h2GevLBjtiRoxN384AdeYBPx2O7jdnz1ea9wxGtypoFAJvN1knCUKqE7CRDBuPoARj0HN5TNLDJ9MX8s67Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483241; c=relaxed/simple;
	bh=2gFiDL3VupG/8sWVskWAbPqYRsDXt3LLxEZvkrAN/K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ep/GGocSyxihN7XqbyI2HPYkVRFoyk9rry0DwUFb0AulVYDZwKLApsoU1WdFADRVdK7MK8UXP4FI4AEBNO1R1bzSC1sjql7rijRxhky6oipQeQS4TTp1EYTartdk0Co0lEEBWv1qontyU9aKcrCuuaQuV2fTNw4gPMgjUPpcgQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdkRcEWe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdkRcEWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED65FC2BCB0;
	Mon, 11 May 2026 07:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483240;
	bh=2gFiDL3VupG/8sWVskWAbPqYRsDXt3LLxEZvkrAN/K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RdkRcEWedDRQSgz6SUsTh/+VkrY82V+Dd235f7fSmEG2+M/ZH3uR+f0V3ugAuEG/6
	 ATPeKGCRLMVI/HpfkhJ6qzcd+kkPaG9KGcqiwupTsOJ4eOqXfePCZRRCJzx35UZZ/S
	 XxXn8REH+RZtVQLIdYQ6kAaymWTHe8DubBt9rsZFycpxvwkFu5b3kTQurgDyKr8FBT
	 oQTrUO176f2wReYo7YK8u+w39t7riZkArkYDO3QvPUms+V9KdPf+3lpqB0mkylwi3q
	 rcmxxG+sL7TZu3ZcqcsCkOtjo3DY2qjf0ZSrRC6q52yfZxJ5qHmlgcf9odJxu64Qo1
	 nr50UZVE5ek9A==
Date: Mon, 11 May 2026 07:07:18 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: add fixed regulators for
 OrangePi R2S
Message-ID: <20260511070718-GKC3624147@kernel.org>
References: <20260410100010.1197804-1-amadeus@jmu.edu.cn>
 <20260410100010.1197804-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410100010.1197804-2-amadeus@jmu.edu.cn>

Hi Chukun,

On 18:00 Fri 10 Apr     , Chukun Pan wrote:
> Define the power input and the 4V power as fixed regulator supplies.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index de75f6aac740..409a6db269ae 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -21,6 +21,25 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0";
>  	};
> +
> +	vcc_5v0: regulator-vcc-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_5v0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	vcc4v0: regulator-vcc4v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc4v0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		vin-supply = <&vcc_5v0>;
> +	};
>  };
please check my comment below, I think this patch has similar issue

https://lore.kernel.org/all/20260511065338-GKA3624147@kernel.org/
-- 
Yixun Lan (dlan)
