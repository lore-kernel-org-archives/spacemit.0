Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557405;
	b=sH/0L86Fk/PwldAMQe+vXb1x6fEtlLJD3HXGpKS0w5sQPhDYAn8ppPCQDWl/8sH0JPf9
	 ftMC4x48bHVNmWfDrO7YVdidH9KOf+NDlEYDf/obYgYqDcobpP7Fb7Ef3ssSUUwMwxvSp
	 CJCfkgHlmqOqdniJtBaha+07Snhh5qEh2k3sVnHfzKT2f/Woidw1SJkH+uhT1X8KuXI3w
	 AhxG8rGxg/OXISI6MWDKxlTs+klMtaSmNB95nB75tFe48bodXNZ22uNJer6nlCHeKAS4i
	 RZRTJJMeTVIM9j9f37GoQoV0DJ/h0Uyuwivns7V0Eeg2UkuSCtHnm5G9RmCfpIwOBDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557405;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent;
	bh=9X06TH/eKKW7Q/OT28lgH1tdTkDqNa2x4QON52BKzhU=;
	b=io6Amcq8o3TC27wSCitn8uLVkG13MdsgnyxS9S0miek+zQbaZdDqq0W5opyfuMQ9M+vP
	 ixo6wglkfcL8UnL8CQtupg4w05oZY1cbENiEekLQRAIs5EwX8mybfDmUyDpQIrqVRS6DW
	 0U80XpwtO3RKpfKNk73DxIBJpUEy+GPtWzEwsNEaH7YNqQTZJurDU5w9zrrk2qZlz0wea
	 OZTJiV+o41+/JhqPqO8bVZTc39d0E9OnzDYljEQhxPTYRZhvR2bLO2Np58/Of0/4Lh1ST
	 vzc7lMBiSyUO/WFxUeISpp4PqCY9Y6g9EwelKAIuOkbApMJFLgV9jrRFZDjkN1dkr3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=QgUCELLF;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA52C606A31E;
	Tue, 24 Nov 2026 21:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA52C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=QgUCELLF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=9X06TH/eKKW7Q/OT28lgH1tdTkDqNa2x4QON52BKzhU=; b=QgUCELLF9S0Pdj6zZVDyGQPsbG
	9HslDjK3iUkWJhSQFryuJSjvGbl/jNexc5qsiqF74HwfVuKvX0FAXdAxe2ICmGN2zCcs1E7GFrco/
	UwSBPU4a9IvNcp1T49T8BE7AetVOeTyoFcT9iAGfmoPmGLMr52/nj+W4JusSI4+PLw1NDzyD4N4WW
	B35UzJzzj50V6rhjONOmWtW1KiNWhCjlKVUA50KGuw1WsJ8r7jvFl8D4iDoM3fp9+uUiA7wXNuag4
	yxs/uyGcRBODd+oL42kkPdnEVFXt+SwjAuxFPgH0g+yK97byxyYa3J3U9yAefifwT9Z/09td+tYvN
	3p89apag==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xVyVD-00000008zX1-2qFO;
	Tue, 24 Nov 2026 22:56:39 +0100
Date: Tue, 24 Nov 2026 22:56:39 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, me@ziyao.cc, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Add K3 eFuse and
 temperature trim cells
Message-ID: <awYIF2ynf95-g5-W@aurel32.net>
Mail-Followup-To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-4-duge1256@gmail.com>
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
In-Reply-To: <20261122173810.2409146-4-duge1256@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi Jiayu,

On 2026-11-23 01:38, Jiayu Du wrote:
> Add the K3 eFuse controller and NVMEM cells for the temperature
> calibration data in bank 0 and bank 7.
> 
> Signed-off-by: Jiayu Du <duge1256@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index e89d2cc5ca8c..af1a758788ff 100644
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
> +				soc_rtemp_trim1: temperature-trim@1c {
> +					reg = <0x1c 0x1>;
> +					bits = <0 8>;
> +				};
> +
> +				soc_rtemp_trim: temperature-trim@ea {
> +					reg = <0xea 0x2>;
> +					bits = <4 8>;
> +				};
> +			};
> +		};
> +
>  		mimsic: interrupt-controller@f1000000 {
>  			compatible = "spacemit,k3-imsics", "riscv,imsics";
>  			reg = <0x0 0xf1000000 0x0 0x10000>;

This looks all good to me. The offset and bits matches what is in the 
vendor driver (after mapping each bank to the correct address).

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Small nitpick, no need to fix it, but the vendor device tree also define 
offsets for soc_die_id, soc_ver_id, soc_pack_id, soc_chip_id and 
soc_svt_dro data. It might be useful to export (some of) them.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
