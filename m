Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949810;
	b=o3uUfAoG55BkWBGBXlGXtmFolGD3FsTEEArL9lM1g3PV8HaBAXSX1UlB8UI6y825thn6
	 ezHdmoP0xuEjnYZqV2HjsiKl2Mzw197kzqWSMcY+h91cK49MDZn0vYVIWkWpmLxrg23OR
	 kK+4T9vRWKyYX75nLMpKlcGaKD+D6wTNuUM+7W5+E7fpwAclKPU5Ra3OzEQCnqZQgtUaT
	 Wa+JwbLoaRm7+v75uYVmOUUjync1oI7SiyoS82yMFsVtVaDRS+4zldvLcVENzLMRvdmMp
	 kWB1SchaQwHbmZcB21DdjF4Bvbd2tNVsiRXVoOFjY1P8lU90Ude7fuaS1sdQgZSEk9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949810;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent;
	bh=HICfFCG+80CknwwzIfTqwAoMgSOt31xC2GzuBsrcSvI=;
	b=ra532ianRX/qidt1NSSMXvRVAiREhmSdg80bWinTXi6Uk2TeN8XVoqRTfqHOcwyHgwLI
	 NVnpdGfR+bjirMuzHMTerSIPpqx2cQWQfeHxb2bEl0CLwIV+dgBl9H1hSGzcVbSPf/KCm
	 bhOFqDxrPNdiQNco0HuJJjXxQam9EL4vzeDNuMXmkEeKfVCe1V5N6EcESbHkUAXVlBOHC
	 CoNvSxF5JSlMpX/JXJBIZ9HIGzfL6d0fgyc0tyXNdq/E3ZsnUwGPyQ49jFKpYdGPLWAVw
	 3gXRMO1aZLDErtoRYur/OJS7ca4EmSskPqTUIbFXCR+sat9s89m5NfoT+b1w5I8kmzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=u5qDXirI;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114E9606A32A;
	Tue, 17 Nov 2026 21:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 114E9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=u5qDXirI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=HICfFCG+80CknwwzIfTqwAoMgSOt31xC2GzuBsrcSvI=; b=u5qDXirI+ef4oJPlGYOxMTgkg6
	jJr1x8m0UrWOZS6hIGBEWwoQMfNbN1iUU7+1EJV7f7pWVE/JO+mIbvzz5bpAQC/JlqADt6/J1zKf3
	ht7sDLpyCV+P9lFEWgbBM2Ark3wCpJbCFTef7Hbtt+9B6VXnxgrGZoA7lhn3kbEWBHEgtYviVqxjp
	Xur/6/nhrHVpEBDSWZ9vspga5Pyd1PEbaCBObraLtVmqdZluqyREsSkagyyOHjcT1EvvZYnQ9G9XM
	1fLFwcIgUlBUTb3vKFbKn0wIplndFtfBq/TrR3miJrlrWGCv2wqB/QwfI9gKDkpzHwM8voKfOnjFa
	W97kXp/w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xTQRJ-0000000GYH2-31Kp;
	Tue, 17 Nov 2026 22:10:05 +0100
Date: Tue, 17 Nov 2026 22:10:05 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, me@ziyao.cc, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: Add K3 eFuse and
 temperature trim cells
Message-ID: <avzCrWttYdMEtB-e@aurel32.net>
Mail-Followup-To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-4-duge1256@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116075423.1519438-4-duge1256@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

On 2026-11-16 15:54, Jiayu Du wrote:
> Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
> fixed-layout cells for the temperature calibration parameters stored in
> bank 0 and bank 7, using controller-relative offsets.
> 
> Signed-off-by: Jiayu Du <duge1256@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index e89d2cc5ca8c..b548f5029d59 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
>  
>  		/* sec_i2c3: 0xf0614000, not available from Linux */
>  
> +		efuse: efuse@f0702800 {
> +			compatible = "spacemit,k3-efuse";
> +			reg = <0x0 0xf0702800 0x0 0x400>;
> +			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
> +			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
> +
> +			nvmem-layout {
> +				compatible = "fixed-layout";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				soc_rtemp_trim1: temperature-trim@120 {
> +					reg = <0x120 0x1>;
> +					bits = <0 8>;
> +				};
> +
> +				soc_rtemp_trim: temperature-trim@19a {
> +					reg = <0x19a 0x2>;
> +					bits = <4 8>;
> +				};
> +			};
> +		};
> +
>  		mimsic: interrupt-controller@f1000000 {
>  			compatible = "spacemit,k3-imsics", "riscv,imsics";
>  			reg = <0x0 0xf1000000 0x0 0x10000>;

Thanks for this new version which is now enabled directly at the K3 
level instead of the board level. This looks good to me, except the 
offsets values, given my remark on the other patch.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
