Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2601247289
	for <spacemit@lists.linux.dev>; Fri, 25 Jul 2025 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753446444; cv=none; b=VKzEr9z6Up3had8cnAXtcoBJDTnYMfXyD8au0ZFl0K/3bvHv5SStQyfPkZfsiUdKbpulURK2/YkTpKxy1VE+xkj+07HDf6Vv2EEhZ8v3ep3ePsYvEmY/1xFgys0MqYCsxKr9B98V6b3A+TLwV7Jd1pe5OX1fCYcoKD0LhhAQHow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753446444; c=relaxed/simple;
	bh=7y2jb6GkOxJ7n0h6bbRCBTz+o/AxMfRSADbIZa8A7TE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INIywO1/Ldpyvk0uxUFw2kmItCEcMloVc3yBo4aErC90VrrI+LmNjoV0bIFDZJt04I7EYaPgu7E9H4sCNc46AQqloKcyuPKMfXNETNhAVG/psXEIhpAzHZkcFf+zRjOUhAk3YOqDN4pPV65gyShSfJjnvleop9RkFIzWWK7U7vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=epbSVreZ; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="epbSVreZ"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3e293a3b426so23968265ab.1
        for <spacemit@lists.linux.dev>; Fri, 25 Jul 2025 05:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753446441; x=1754051241; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A/mBvaMsi9x4Ax/J09iijgNlpW3/r7uWvIizFrxl++U=;
        b=epbSVreZoGHmkkKhAjoMHo0bVbMj9NZS3Cx5eTvA19Zh+j1shlL7rqsFxIC0umnMvH
         zatuqD5qwC7yp7HZgmIxcmo169Y/ACMMAyCCM4Sj3Z3DzsS7Zsb50+Hq8Q/gHUNDtmez
         CR/gAikz05m3Vllos3hRJFce9Ocwm2kZEcO116Y/dM1LT/U+X3miSyWZ4VVTxV475DGQ
         J64eqDZtt3DC1UfqDtwKnVDagB6DXukOBDrUZW2wNYouM+YqH5eSz42JPNHPsug4uLx4
         hsOet8vjgt3J33/q/L8iGBSX4+ygljA6PhjRVOVSEo+XzG9x0aAzR2eBF1fiGf0Z8v+S
         YH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753446441; x=1754051241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/mBvaMsi9x4Ax/J09iijgNlpW3/r7uWvIizFrxl++U=;
        b=nT8MAZ7WICtPKkp2cjkHzTQJV3vSxBiufyUPNq4aowlUn5nZUULKQHYldygJh3vk+D
         8Ykb2ppKUdJnlo9bNWAVnlBgLrKaAcGAxEWy4B/b0G8F73zlE7TKObq+5oIVJQtSkcS/
         k7maGf6qaRxMlwsLy1Oa77oKxN6ejzQA3SrZ62lcYILgFJ1beaM9IdsbxjJexGlzQqpC
         Ty2PnXxWqZwBseNaLwJ4qaQAqw0CYJJSAmNwG6j1HNWCemcOMEY31aZ2BGbvbqmmIjQo
         3Y/tVgoveaHJxFwfKSXCD9sb8t2zxeUhMX0Xe3gj35kl+ouULaz0+yB2LeVN2g7dQF7H
         cXwA==
X-Forwarded-Encrypted: i=1; AJvYcCVemyA1l5N47m1CmXVoHAF8vRSjl+UUVm06np3t1JfqPtMnAFAnQ0PzopBtKsX1W+8qejbBTdof0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdceflC1GPqA3xz4VvW0dNQY3M8ZYuxAI8JXeOsfojJsHwNTlD
	cLOkrvhWTeQCxKUxcauvQsFeiL6l6LVN/ZlcR/Zg3zu63HXZV+6vesoayiFzYAjmu1g=
X-Gm-Gg: ASbGncveXJLf8ZIy4p+c99L5dsd7M6eVTqkOQ0cI0Y+/qi0dmgS6k/Uq6Z6CRqGLrgr
	o2bsEWjtSNYPxoIleFENOPK816g2xY1xoGbAlyYNABWdXV91aZjR5CXTF04U9cNlOeJ8GHmGRY9
	jyh/bzGKfTNFVXqVi2nBQ5KZfcm5VD176LDGgrKkVQ6gPQkUSYy6pb1oUFZYzWor5ACldECqo+K
	6LJii4HwOT7xmtEELtnahhn+biVd94j40kxuGFUZdSoHQypMmdCAusZ3j7FZ1lUUfJOqssBOnNY
	hnPefQiRkJ6WXqBabTBc2hOH8KQJ39Q9qP2qgB7nqEsHMpnaBYh0w4AjfFDG2X83NFqJPqy2IAk
	WJVNKzJHgS7YegojGE2BN22PqMk36NLfsCw==
X-Google-Smtp-Source: AGHT+IFpJvG04PuJm5q96eMexOibQMJOXrzeJLswA3Q+kKbIfnRtQOm28/7c/YDY/oduCAUIYURw7A==
X-Received: by 2002:a92:cd81:0:b0:3e2:9fa7:a60a with SMTP id e9e14a558f8ab-3e3c52414bfmr27234165ab.3.1753446440729;
        Fri, 25 Jul 2025 05:27:20 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e3b7248082sm12856165ab.60.2025.07.25.05.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:27:20 -0700 (PDT)
Message-ID: <bcab3c8d-af99-44c7-a994-b5e0e5c39c7f@riscstar.com>
Date: Fri, 25 Jul 2025 07:27:18 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] riscv: dts: spacemit: enable the i2c8 adapter
To: Yixun Lan <dlan@gentoo.org>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mat.jonczyk@o2.pl, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250724202511.499288-1-elder@riscstar.com>
 <20250724202511.499288-7-elder@riscstar.com>
 <20250724211113-GYA748868@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250724211113-GYA748868@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/25 4:11 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 15:25 Thu 24 Jul     , Alex Elder wrote:
>> Define properties for the I2C adapter that provides access to the
>> SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
>>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
>>   arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
>>   3 files changed, 33 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> index fe22c747c5012..7c9f91c88e01a 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> @@ -40,6 +40,21 @@ &emmc {
>>   	status = "okay";
>>   };
>>   
>> +&i2c8 {
>> +	pinctrl-0 = <&i2c8_cfg>;
>> +	pinctrl-names = "default";
> ..
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
> I think these two can be moved into dtsi, as they are
> common and fixed properties for the i2c controller

You're right.  I will update this in v10, which I will
send later today.  I'd like to hear from Lee before I
prepare that though.

>> +	status = "okay";
>> +
>> +	pmic@41 {
>> +		compatible = "spacemit,p1";
>> +		reg = <0x41>;
>> +		interrupts = <64>;
> ..
>> +		status = "okay";
> status property here can be dropped as enabled by default

OK.

>> +	};
>> +};
>> +
>>   &uart0 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&uart0_2_cfg>;
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> index 3810557374228..96d7a46d4bf77 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -11,6 +11,13 @@
>>   #define K1_GPIO(x)	(x / 32) (x % 32)
>>   
>>   &pinctrl {
>> +	i2c8_cfg: i2c8-cfg {
>> +		i2c8-0-pins {
>> +			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
>> +				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
>> +		};
>> +	};
>> +
>>   	uart0_2_cfg: uart0-2-cfg {
>>   		uart0-2-pins {
>>   			pinmux = <K1_PADCONF(68, 2)>,
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index abde8bb07c95c..2a5a132d5a774 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -459,6 +459,17 @@ pwm7: pwm@d401bc00 {
>>   			status = "disabled";
>>   		};
>>   
>> +		i2c8: i2c@d401d800 {
>> +			compatible = "spacemit,k1-i2c";
>> +			reg = <0x0 0xd401d800 0x0 0x38>;
> ..
>> +			interrupts = <19>;
> I'd suggest to move interrupts property after clock, see my similar
> comment
> https://lore.kernel.org/all/20250724121916-GYA748228@gentoo/

OK.

					-Alex

> 
>> +			clocks = <&syscon_apbc CLK_TWSI8>,
>> +				 <&syscon_apbc CLK_TWSI8_BUS>;
>> +			clock-names = "func", "bus";
>> +			clock-frequency = <400000>;
>> +			status = "disabled";
>> +		};
>> +
>>   		pinctrl: pinctrl@d401e000 {
>>   			compatible = "spacemit,k1-pinctrl";
>>   			reg = <0x0 0xd401e000 0x0 0x400>;
>> -- 
>> 2.43.0
>>
> 

