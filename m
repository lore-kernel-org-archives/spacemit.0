Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C42375AA8
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 11:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499813; cv=none; b=KAuBQFSwrBR9QPC0SgCgVzyEE0m9NlNAQ5tO9ojx5yQKZ4J2V9x7AHRzi+1BZd3rTI9e8mX4LvKwFSaJxf6hRhywNw279f95hgNsqRm+r7JsRi9knkw0bQJkguWUtLNdncYDLP8eiEoMdYU42zeOB4P0BMtwghpndsuS8sVtmQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499813; c=relaxed/simple;
	bh=z3Lm7HpwUT3CHnQ6JBExuWySXx5/0hgPmQoR7JuuetQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ba5IQ0IGEpJR+sLIqpq7SVu9LenSnAd2Ezwf7oLzK0D63AoUghgEK+7NOC3cIXaPtvKeQ4gBK7Z3aKN44Pvz0k2Uzjnny+vNR+SzIhcgg4BOy6ebqaZYoN1xwwem5eyYEljCsKuQFEnHvh2MouagB19TndxKVZEAXWIlkdoVkrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXoKX+9s; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXoKX+9s"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2590833f8f.2
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 04:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778499810; x=1779104610; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vq0OHDPrSqmT5iEr31Nrcm4QgRLDSjmnaM+8FKnpEIY=;
        b=bXoKX+9sFL1u33QAW0WjkinntQUaG8UEu4QLer8BKixWhgUNqG00MnBmnkyZwjLx4Y
         cqn/HarERg5vPAgLnsrCWjR3zo6qr/wgelTy4eapqXeQKMvBA5sHyWQi/P7k0CK6kgvw
         JRY1+ldDI06aUgNrXGfp+RltXrztoa+47/1peUFE9kwU8pe96v2V0dNqvvtA6t+JmNZw
         Q4rFFUTYkumr2HLFPenI0cPF3iI5UxxUszr81m2f5NufD0zLytiM7r0UAiy36dDQReBc
         WY7oLbrSsVVPorTO1JqvEzVQdonv4jad/ff2BfQS6ol7jGjbquiZ9BEbcavJNvhZHw6y
         vQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499810; x=1779104610;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq0OHDPrSqmT5iEr31Nrcm4QgRLDSjmnaM+8FKnpEIY=;
        b=Knz3Okn0yk0iKQZnqXkXalfOun3Pi1whjvDl78r8Ec7g+GSgfMwJf8DpFBHSEYXgNy
         7YgFHegVFI0GxGg9F8hWiHAL8PoJsliQ+yHBL7mTjAqKsWbMzSXkXlO0YF6AiU2m3JYi
         woya9chApiGC1z5MGhXCP3nkJ0tcyjxolHsad4HQ5FjkkyhtpgmfF4+nUBEPe8wBbTTM
         SF2QTx178XiWVDUIq7/7zmkfIa+YYuYZWzcMO5ZX9oNatOR711H/nsQfNPdokPqU3XHz
         OP/TyrIq+u6Yi2pgnoglb07cb3MqypqT5RE7X3nzIXp95e6LYk2Db9829xfm4zs++WAN
         LOsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XwpaZUpwi5RyNOnViPVDCIpOEfCLjO0ZUAObVJI3GrSRXzu1y0xIqLz9V/3CN2qOevSQugihguw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4izNlcxa1EW4IxSK3nclQtfRFtHy6lbwrKm200/lqsC9iMAfi
	AtGpfsOD2sJmpSD82KvITNcMCNdvu1fV9aKOfoKCl9/U8TVOLIIEgrXt
X-Gm-Gg: Acq92OHF2MSgbZzfE+GvvyX7o4VRHSN7rkLTrrROdjhWfQjmSAfmkwuGoBOk5BKgq1V
	4feRAhhPWEwHksrzIFOSw8pkECDXbtCdsBit/GaWl1h+9W9Ybu7APScBbP0Xa9hav1/5Q3cgjSo
	lIdbln6CTVHIQ1ueV+JtGWDREQ8+GLwY2jLBR/kfagunRQytc4XlkhoOf0E0tmJzltD5tfq71Ee
	a7Ato6qjnajHre/KaxoJlB1a3i7WBdohPW/XDKExHWcdfqZyP2yAs2ZX91o8VBJJZAGEZSlcq0a
	bovR0o4YlCV8FMwEczAWgvPCkAtDbczJOAu6dfD/zViH98D65hyfDPNohCL1PEcMd4LTWVdGL7k
	9MPzwkBAINicEwG7OJZoKBY3I4svbvRFX3tUUiwXbH1aVzd0MsCxeJMWQMbj4/YjJduHUCUyhlM
	Ev8o3aACAjFwC8iIu+CxtfDl4OxbpE91HI9CgvqS18D77c7ipiXT+8hy1L+XJimB0=
X-Received: by 2002:a5d:64c9:0:b0:43d:75ec:26f7 with SMTP id ffacd0b85a97d-4515cb3d91dmr38402992f8f.29.1778499809527;
        Mon, 11 May 2026 04:43:29 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-458b3664e3esm9488989f8f.3.2026.05.11.04.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 04:43:29 -0700 (PDT)
Message-ID: <46f93cdb-e65d-4c83-9050-f8223690b0ce@gmail.com>
Date: Mon, 11 May 2026 13:43:25 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 8/8] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Trevor Gamblin <tgamblin@baylibre.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
 <20260511-orangepi-sd-card-uhs-v9-8-ae48c0b2b2cf@gmail.com>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-8-ae48c0b2b2cf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Iker,

On 11.05.26 10:54 AM, Iker Pedrosa wrote:
> From: Trevor Gamblin <tgamblin@baylibre.com>
> 
> Update the Muse Pi Pro devicetree with SD card support to match what
> was done for the OrangePi RV2 in [1]. More precisely:
> 
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with inversion
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes
> 
> [1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>

with the cd issue mentioned below this is:

Tested-by: Andre Heider <a.heider@gmail.com>


> ---
>   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 66 ++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 29e333b670cf..774a4640f065 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -18,6 +18,24 @@ aliases {
>   		ethernet0 = &eth0;
>   		serial0 = &uart0;
>   	};
> +	reg_dc_in: dc-in-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_vcc_4v: vcc-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_4v";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>   
>   	chosen {
>   		stdout-path = "serial0";
> @@ -77,3 +95,51 @@ &uart0 {
>   	pinctrl-names = "default";
>   	status = "okay";
>   };
> +
> +&i2c8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c8_cfg>;
> +	status = "okay";
> +
> +	pmic@41 {
> +		compatible = "spacemit,p1";
> +		reg = <0x41>;
> +		interrupts = <64>;
> +		vin-supply = <&reg_vcc_4v>;
> +
> +		regulators {
> +			buck4: buck4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			aldo1: aldo1 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +&sdhci0 {
> +	pinctrl-names = "default", "uhs";
> +	pinctrl-0 = <&mmc1_cfg>;
> +	pinctrl-1 = <&mmc1_uhs_cfg>;
> +	bus-width = <4>;
> +	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> +	cd-inverted;

cd doesn't work with that on my muse pi pro. This on top fixes it though:

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index c3920fc708f51..ad68ded8dfd7e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -396,8 +396,7 @@ &sdhci0 {
     pinctrl-0 = <&mmc1_cfg>;
     pinctrl-1 = <&mmc1_uhs_cfg>;
     bus-width = <4>;
-   cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
-   cd-inverted;
+   cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
     no-mmc;
     no-sdio;
     disable-wp;

> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vmmc-supply = <&buck4>;
> +	vqmmc-supply = <&aldo1>;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status = "okay";
> +};
> 

Thanks!
Andre
