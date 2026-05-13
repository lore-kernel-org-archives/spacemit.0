Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEFA3D79F1
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778659020; cv=none; b=uwVp89+WkvB+dH7bjB728Ts9r4j7YvBqJIqINv8BnBrpLbL8HYHcdQdeIl/v3nlkciU1n2rK4VBNT7mXneyY36Ub7dml8fHyUPCeZkN1EVInsTwqmjHHZT87Osyq7ZEQRHS+hjRBwIHeZbqHbUsPXOKSQuP77cBOTEE3RO3jCX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778659020; c=relaxed/simple;
	bh=6TrZU2mNEsrcV/7k1CDrRUCsQisNLW1vz5Mke7Davz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MftO5Tx7DFCU30s0/lTD3LCwBo3DkrTAcHkPR78UOvHYHkCfc6AwNE31mPZ0XsRuYF+ndavtHxjX/9LrK4sbQa0/idX4aJF1X4YH6b+zAmRdbJ3NNx831hMqPN5ciqoH3mAGiTNqUR/EuBWn5pFf2Eik9hUg3O8esjDuwWbJ5SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxLupMKr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxLupMKr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ad135063so51610665e9.0
        for <spacemit@lists.linux.dev>; Wed, 13 May 2026 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778659016; x=1779263816; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7duSVgYKIOQw30efTE5UcGH1h1Zr68CDYsggisvPQ4=;
        b=TxLupMKrSfSZNXPJS7DHCYNxc+v2Ax/RfxIKWXFQ0CICGdqF75scoLrbdP5rwSuU0k
         GKJ2rfFUoBrjn9f7TB4qCUbmSTGD4BmY5dedkKd3DiGz9vJPXjt8McI8sOao41tABa+6
         OBK8BlQlZ6E1FrtNZWhC7wDiqkjltU953q3ggLE5jp8uefRfcSR8HZSOq5O6joozDyJE
         XwzF4aP2WN5YizqoRwQpw5whEsXyGBlJsNwsKWsMVQRvBntcZAICIqjZUXIlb8EXh24o
         dSbg6P1kaiGIWZ5/9N1AEx+ultb29sNhMehF4dwXzxhwRk/yoNPqHuIbv/a5H9YOnPcM
         xmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659016; x=1779263816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7duSVgYKIOQw30efTE5UcGH1h1Zr68CDYsggisvPQ4=;
        b=MjQA+LoOqCJMKN34MQuMmnqzVoHug90fisDs3f5VqpWDOgikuh5ujflEBa2GsICrsE
         6bioDBnale3FfIyyJv5LhvmLx/gyxkcspcanfW7MU61HGyw+fEvP3f0dNIXsA0FwZz5Q
         woD/C/02BeWla6dfX9IxKQWb7nAPoxfRk+t3TdQduuMOLy421htBhRIl+c/Xs7GntyIC
         lSRAUi2pLkHjnUIrvgenqO6Em5tiN2dfr/Jzy0oSCL2qM/69edMh1n5X/o7GgmfaH/3m
         hTTvwBgG02pVYN9R6lYkbaDC+ZLTXWy3rVomEp8/2Xt4+jYfFJC8pMv70UCl8CSkGLCG
         s/sA==
X-Forwarded-Encrypted: i=1; AFNElJ9FvX7CppNh55Om93U1cJI4Pks9Yx4CVGZSX5TomLAuou6YsGgt/sv797Eof2kdCkHGsy94GS0fhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEb8eEAq6QJZikXdOF0eqnSasdeuoiVmlD2aDKxOFqpzTgSDJy
	ZIdTb5aolIpNeXlX6d64xqZ+iRkiMG0M3dCt4fy9DcVQ03ilaedfphJw
X-Gm-Gg: Acq92OGh+/V1xSCu1suCFTT4GIErZSCbQycK3aiVHk2ul8Edm8PTvUYAURBBYl/jHpl
	n7csEuB3un5xiRa0phv2JqowweOI+/wKS42bqKsM9rpBGY8NsFQqDAwPI4G8d9mm6YjhPqbFeIr
	HIwhdXRBbgX6oOXk5ifMQkPxZ90BETrtv48iwrArrRP/cBtTq/MNxvhBftHILCN5P8juXgJ8JZ2
	nDjgTGVSbn4iuCVBiEqxONFKvR+5W+FAiJLXOskn5V0WA8L4F5Ro5CM1WzgiTQDCYwlQphC7HIS
	xvZl1uH1FSrXvF7TQAtTBCK/R8znBL7W1BQbwZ3l8hWofrddT8AOrH0GeOt+RfoqJyaiv+jiJYH
	gnk/Ao+56YbMARkMlBJvzFDtgeas3JUu8mJ1A4S8j8GYrdais09OFwGCt90uaBfH+SKrZptE/Ep
	uAkJySzSV13W2TGIOC4bRf2vCNDxIp5a1dP27T1UdSx40/3GYDE0Yaj+hpiILbcvE=
X-Received: by 2002:a05:600c:1d14:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-48fce9c3a2emr22415995e9.12.1778659014515;
        Wed, 13 May 2026 00:56:54 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce06ca2csm27025055e9.8.2026.05.13.00.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 00:56:54 -0700 (PDT)
Message-ID: <171c3f3a-91bb-4620-aa39-ffc82bd272a5@gmail.com>
Date: Wed, 13 May 2026 09:56:52 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] spacemit: k1-musepi-pro: add missing devices
To: Yixun Lan <dlan@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20260513071958.29574-1-a.heider@gmail.com>
 <20260513074644-GKA3624092@kernel.org>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260513074644-GKA3624092@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yixun,

On 13.05.26 9:46 AM, Yixun Lan wrote:
> Andre,
>   
>   Thanks for pushing this new version, overall, this series looks good to me,
> Although there are few quite trivial issues, which I could help to fix it while
> applying, let's give community some time to test and review..

alright, and sorry, my git send-email flow is a bit rusty, didn't notice those issues...

>   P.S I haven't run it on musepi board, but trust you tested all functions..

I tested the added devices except nvme as I don't have one connected.
But I do have a pci card in there, which works just fine, so generally speaking pcie works and I'd assume/hope nvme would too ;)

> On 09:19 Wed 13 May     , Andre Heider wrote:
>> Add the missing devices with their required regulators. The regulators are named after
>> their label in the vendor schematics[0].
>>
>> v3:
>> - drop reg_usb_vbus, non-controllable and served only as vin-supply
>> - fixed regulator-vcc-4v0 typo
>> - fold addition of pmic regulator labels into the pmic patch
>> - eeprom is a GT24C02B, fixed commit message
>> - added reg_qspi_vcc1v833
>> - fixed uboot nor name offset
>> - add missing "reg_" prefix for reg_pcie_vcc_3v3
>> - drop pcie{1,2}'s vpcie3v3-supply, it's already specified on the root ports
>>
>> v2:
>> - drop reg_vcc_5v0_sys as per "non-controllable" review comments on
>>    similar patches for other boards (kept the root reg_usb_vbus for though)
>> - add reg_vcc_4v0 instead as p1 vin?-supply, misread the schematics
>> - drop mpcie_vcc_3v3 and use pcie_vcc_3v3 for pcie2* too
>>    ("non-controllable" again)
>> - all of the above makes it consistent with other k1 boards
>>
>> v1: https://lore.kernel.org/spacemit/20260505160623.1369347-1-a.heider@gmail.com/T/#t
>>
>> $ cat /sys/kernel/debug/regulator/regulator_summary
>>   regulator                      use open bypass  opmode voltage current     min     max
>> ---------------------------------------------------------------------------------------
>>   regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
>>   PCIE_VCC3V3                      5    4      0 unknown  3300mV     0mA  3300mV  3300mV
>>      ca400000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
>>      ca800000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
>>      ca800000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
>>      ca400000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
>>   VCC4V0                           8   10      0 unknown  4000mV     0mA  4000mV  4000mV
>>      buck1                         1    0      0 unknown  1050mV     0mA   500mV  3450mV
>>      buck2                         1    0      0 unknown   900mV     0mA   500mV  3450mV
>>      buck3                         1    1      0 unknown  1800mV     0mA   500mV  1800mV
>>         2-0050-vcc                 0                                 0mA     0mV     0mV
>>      buck4                         2    2      0 unknown  3300mV     0mA   500mV  3300mV
>>         d4280000.mmc-vmmc          0                                 0mA  3300mV  3300mV
>>         QSPI_VCC1833               2    1      0 unknown  1833mV     0mA  1833mV  1833mV
>>            spi0.0-vcc              1                                 0mA     0mV     0mV
>>      buck5                         3    7      0 unknown  2100mV     0mA   500mV  3450mV
>>         dldo1                      0    0      0 unknown  1200mV     0mA   500mV  3400mV
>>         dldo2                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>>         dldo3                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>>         dldo4                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
>>         dldo5                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>>         dldo6                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
>>         dldo7                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>>      buck6                         1    0      0 unknown  1100mV     0mA   500mV  3450mV
>>      aldo1                         1    1      0 unknown  3300mV     0mA   500mV  3400mV
>>         d4280000.mmc-vqmmc         1                                 0mA     0mV     0mV
>>      aldo2                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>>      aldo3                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>>      aldo4                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>>   5V_VBUS                          2    1      0 unknown  5000mV     0mA  5000mV  5000mV
>>      c0a00000.usb-vbus             1                                 0mA     0mV     0mV
>>   VCC5V0_HUB                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
>>      c0a00000.usb:hub@1-vdd        1                                 0mA     0mV     0mV
>>
>> [0] https://github.com/spacemit-com/docs-product/blob/main/en/k1_muse_pi_pro/pi_pro_hw.md
>>
>> Andre Heider (6):
>>    riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
>>    riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
>>    riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
>>    riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
>>    riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
>>    riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
>>
>>   .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 309 +++++++++++++++++-
>>   1 file changed, 308 insertions(+), 1 deletion(-)
>>
>> -- 
>> 2.53.0
>>
> 

