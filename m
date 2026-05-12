Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFFC368D5C
	for <spacemit@lists.linux.dev>; Tue, 12 May 2026 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588455; cv=none; b=DbuYvNIoH2sTnujRHSJ3f2Wg7+nQrIJUMEpURVxArE9KVOhrtkvuJ5qQhytb5yjGlN/2El6RPP73ERAyouGeGJ1rifgEth29rQ91qhylZjcwh4ztIZMj2ePBxjehvtH4Lgl5xpx2APcSerxEFSgo21DptAnARauSWTEy5j5RBsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588455; c=relaxed/simple;
	bh=7SP+tpQC7/RleL3IvjZFwBLSatpQVTWn6uCxFw5dSFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NS/bE8w17QQtB6RsB3z6u3JPLlMpr1yZ9Tb4MrAVv4yCtQrdbjXFZzSVgyIojiMPFzQVtOWou8MNRwkl1Zb9e0ZaFZX4AI1doa9kpEjTGjY00k/Lf477bQAT68p3vn/sZhrjz2a8pB3WPniED+WwRN7dCJFdEDPPckqDRwi0qZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JP+ZIcH8; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JP+ZIcH8"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso4444921f8f.0
        for <spacemit@lists.linux.dev>; Tue, 12 May 2026 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778588452; x=1779193252; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAedPaQpPe7CcNir+E8j0QYU1SXE2Pa0U/4eeZrHwts=;
        b=JP+ZIcH8JKIz0rGA3jPo8mz0rZQ+AfJLTG+EF0q0euhkOCqFK9MjF83j2ygkI8qLck
         xhyE3ZyDyNhp2JOaLyNbU2tCgQPU7L+aSbpyRhR0LY/8PbI/gxDP0SPBfmTSQ9T/wlIM
         aB1JriiiDVL2vn3HgGZk5MG98HPfS3tAnFeA3uz4exorrDmV7WFewom5FibOClCkqJkv
         tYxhAYRGWLVtxtmlEahoEJZKDf/ZiW/aYINVB90veqEml4tQcEKwGxcpYlIIzo/OJMPR
         KIgKTZ8Bnh8qBJeTB/vnvOVQrTXlQYIFG54AP0NRFl+QYYlGfutxP6LuK48ovTkczOc7
         FKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588452; x=1779193252;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAedPaQpPe7CcNir+E8j0QYU1SXE2Pa0U/4eeZrHwts=;
        b=pXpNVxsBOMK9FCBQLFYGxCwFXH0Ph2/c7wnf6ca/+xLerASoOOYsh4HmoIAO/sOt0G
         1knPV0JGFQ9aki3ql8zvS71emHxcF3nFUEnaRXsHJBAv1IUaiOjUDo387q9QgqlYoy+N
         Xsggq//udHESycueXii5VyS+9MyUbgwSjHhCzwlOZgdWMimb7JVvn4DEvwBZMHwHqSfW
         pBlLT1WHucdB1bXeG3MehEh2n68QhX+ZQnk2PZxRnoU+pK53uacVQgIFA4od8UcltBeX
         ueUja201iCNT3az9ZC0S22u0kwE6HfBg9xM2grwyW7DNR0JuHTpJe+dxuGx4aVZnb9Qu
         8RSg==
X-Forwarded-Encrypted: i=1; AFNElJ+wNIzt+2a25wN7CegZwUQXgAUvrc8RMS4fToB4/aKNcIBrfo7IcE2mgcLctl4vNMJ4XCktN5mmfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxL5kbpSBvi1CeoB2lkrB89bmyJAR6VOjOWbFPQwAvUCuax5vqW
	JOQudZBIXr0HwH6TuAGvYe2iiogR901+on/1toka6Gr3JaW4XM8iXPrZ
X-Gm-Gg: Acq92OHwKrXRJeNXFvmdyWxbuxZwlQ5W2jqvsUZvP/UzYTwyqoEDxbIbD3k14ZyDlGf
	hdAtCKLQ3Qq+H0vsgK8ASmqEln2QYuecHa2iwFPpC0u8ZlBgBiv6AKQus5TVa4TvDDvGdlCwlcU
	DohTpyzkGT+vewmSlCcRwAKbObffV+CGyvoCq5qHiVzZW2A8DzTGVNmu5PeJmrtfKPgSf9zNhaL
	P+u6ON0dBerO1Gu4OH6G3DPaeRae4kN2burC5oKnF66YMbjZYWv/eVMMMro0s90wc29YQFJ6FNn
	riMIhHxLmzQbYyBfNNHkmQ6bCMIpQICisvvh9+Qjb4seK7AYxh+kuef3FglTkeuWlroWr1jCIVK
	VTNFejzHPbAXHDZUFp4JzND6kjJbkYHADDffuZrKtxiSS8zywyWBjN5usXN05rGQplM5Js1FBYM
	MQwQUBvX0Lx+JoX1o2SDQmeE+JbX/BTx9X/41cdJvczvAYxqJxQxneoQ6LuH0CU0g=
X-Received: by 2002:a5d:64e3:0:b0:441:1cf8:be9b with SMTP id ffacd0b85a97d-4515d9a06cemr43636765f8f.37.1778588450808;
        Tue, 12 May 2026 05:20:50 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491f8d4c3sm32022927f8f.34.2026.05.12.05.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 05:20:50 -0700 (PDT)
Message-ID: <a41f87cc-55e4-4a48-bbee-d863e5a4b00a@gmail.com>
Date: Tue, 12 May 2026 14:20:49 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and
 power infrastructure
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260511111116.1109643-1-a.heider@gmail.com>
 <20260511111116.1109643-2-a.heider@gmail.com>
 <20260512113913-GKH3624147@kernel.org>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260512113913-GKH3624147@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.05.26 1:39 PM, Yixun Lan wrote:
> Hi Andre,
> 
> On 13:11 Mon 11 May     , Andre Heider wrote:
>> Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
>> for the board's power infrastructure and voltage regulation support.
>>
>> Signed-off-by: Andre Heider <a.heider@gmail.com>
>> ---
>>   .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 144 ++++++++++++++++++
>>   1 file changed, 144 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> index 29e333b670cf0..88c35ad1ef2ae 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> @@ -17,6 +17,7 @@ / {
>>   	aliases {
>>   		ethernet0 = &eth0;
>>   		serial0 = &uart0;
>> +		i2c8 = &i2c8;
>>   	};
>>   
>>   	chosen {
>> @@ -33,6 +34,25 @@ led1 {
>>   			default-state = "on";
>>   		};
>>   	};
>> +
> ..
>> +	reg_usb_vbus: regulator-usb-vbus {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "USBVBUS";
>> +		regulator-min-microvolt = <12000000>;
>> +		regulator-max-microvolt = <12000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
> I think you can further drop above regulator, which merely serve as vin-supply
> and not used by devices, plus it's a non-controllable fixed regulator

It is, but as mentioned on the cover letter I left this one as it's consistent with the other k1 boards.
I don't care either way, so I'll just drop it.

Thanks,
Andre

> 
>> +
>> +	reg_vcc_4v0: regulator-vcc-40v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VCC4V0";
>> +		regulator-min-microvolt = <4000000>;
>> +		regulator-max-microvolt = <4000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +		vin-supply = <&reg_usb_vbus>;
>> +	};
>>   };
>>   
>>   &emmc {
>> @@ -72,6 +92,130 @@ &pdma {
>>   	status = "okay";
>>   };
>>   
>> +&i2c8 {
>> +	pinctrl-0 = <&i2c8_cfg>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
>> +
>> +	pmic@41 {
>> +		compatible = "spacemit,p1";
>> +		reg = <0x41>;
>> +		interrupts = <64>;
>> +		vin1-supply = <&reg_vcc_4v0>;
>> +		vin2-supply = <&reg_vcc_4v0>;
>> +		vin3-supply = <&reg_vcc_4v0>;
>> +		vin4-supply = <&reg_vcc_4v0>;
>> +		vin5-supply = <&reg_vcc_4v0>;
>> +		vin6-supply = <&reg_vcc_4v0>;
>> +		aldoin-supply = <&reg_vcc_4v0>;
>> +		dldoin1-supply = <&buck5>;
>> +		dldoin2-supply = <&buck5>;
>> +
>> +		regulators {
>> +			buck1 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck2 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck3 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <1800000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck4 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3300000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck5: buck5 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck6 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			aldo1 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-boot-on;
>> +			};
>> +
>> +			aldo2 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			aldo3 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			aldo4 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo1 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-boot-on;
>> +			};
>> +
>> +			dldo2 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo3 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo4 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			dldo5 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo6 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			dldo7 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>>   &uart0 {
>>   	pinctrl-0 = <&uart0_2_cfg>;
>>   	pinctrl-names = "default";
>> -- 
>> 2.53.0
>>
>>
> 

