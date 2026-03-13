Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4253947A6
	for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421716; cv=none; b=K5TVD4EOLuImBoybm3GS+UVN2uP7umebVG6ChQwbqC9gyxSM603r0kenIFTvfh4vQWDs8HkterPS6HLLblWRxiPVPxyAt1uwYvdgp9r37w0O4fTnDno1Qx5yG+2CCHMsfKBGu+DbfbOnsh2sLlBIizeYk8Fe3Ziax0BtzUpvdQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421716; c=relaxed/simple;
	bh=na5aIQmd51a6vTVSTeVTzISuG98aQ2mjt0ZNjgjSa4M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dXl5PHEzESNq3iCOiAUGNrTcun8CY9XUHDd2tdGy2gQTrkRtS7q903LI3EN1lbZ1lTXs3U677/cQNV+jvJqjDvzx3A85OeNShK9X2SqZYyjS0OXZ1exvAw9iO2/WQbOKXhmJENg89Lji2SwNVz6ChdHWDYJNSFnWT4M1FW/Qi10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dQP2KSxY; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dQP2KSxY"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cd858e860aso336342285a.2
        for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 10:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773421712; x=1774026512; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q2wUEHO95agDl9HgpTnHWh4fawNLMxRmnfJlPuyaoJY=;
        b=dQP2KSxYdiSpqy7B6FYruYPLETnKQKFc0I3DJEEWwQHN6feCoGGhr4G+AaWi/658iH
         V5Ednqyb/EEWlzIbolYCLfV/LyjBjWr0ppDQfqGQ3Ke8b6k09Lks6qYclgZWxOvDHtqE
         cdWIkQ6V3MMUpnF7dY2lpndIi8h1IG7/rcB+XQxyvhxvqn6PKTrlU4vSmtl6SJzoMWjL
         JqKUyVJpxfdRJiq4rtSkpZf59aPAWAzXZxxhvc96F4o3uAzyYag/Pt/+LHc3hESmqhin
         RrRVYH96OOflrVc+5JU56+teaCY+/+w3cDPCShMuPyJ0GV9hYXHXJsOVxxWHhh4KZIaB
         8VzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773421712; x=1774026512;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2wUEHO95agDl9HgpTnHWh4fawNLMxRmnfJlPuyaoJY=;
        b=WImRCapqoWmqFfFyv45AJRbqm3gUnWK+uN8hRmffq14V691IpDfmwYfL9cEGcw4phO
         y1L3XExpOo7PaYt2go9ftIHooWkb4JcExYKlN5ob32jeSpT3ngD1WO6lNSXj+ccNG3/S
         JBKmhITMr1HXI0uC3ACokxuIFNu/GB+lSYH+L20yXnNTWufqHhLaEplA6a7Zy2vsq9ZB
         uIg/qtWnv3T/TiUWfTCrL/Qrv7O8PXZx3vpgb8Jb1WsRSOIwJVJU5pLvZl4soaOjvvBp
         autPxVlL0wALo40xW8NNagBJhWj3yi8GRlpvtmn8XB7qLjHTKg1yRi+UftJMCc+MkRl8
         lqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjw/TAsv68CI6IUKzoyCqhlM8fKEcYXL+O0M4mCAjVjGpdPfhFeB4oDi5JbABxFRz3HwCmb7oJ2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUW3xK/cVs7JmDf3fMQh49PUT6mbUMPsjlYY5CXcy3lg4Kt/F5
	Tdd5w6HecmAAwUYEppYlthJNbGtmXBSovI5KxLp2CW7DVrudzoujTpa34gK7/kiBKME=
X-Gm-Gg: ATEYQzy74pJ06oT7ea/zWs9/0KOear+GZnIqayvF6so8fGkoujx/WNuQAkqEZUfAhuO
	DMq3b2+Oga4a/spRSurWOLKM/YWxg4NZzjkuQy+XC68ORg4Zkk1NtUqS1l2Y+VzK0XFd05TH6V5
	s1d13JgZf792KFI8/HKMibd5mwftg9zO0ulpvrBSQ3LSBvDGmxsFv66RRT9cY8NARC94lhGRCu5
	xMDX4mpxC7b+aUOLHp+enOAU0J895TSrAKqT6tUiEAgBl6mpt/rCTAolIxk9tUTsTgadsquXPNW
	YcF7+wbkwBsc1zr+I/HHHalTdyOAl5b91zzrXLV7xN3be3MpKo52/IPu0jSQHOjy/71Jt4grLn4
	QTcreuGM37/3T9eE31ufVZqiWZVk0sY9jOyIPqwNp2bRLNWBg+nSNcnNcywyT1u6SDAVsfXQJN5
	o6djqfl2FHJGUu/XtsqhVrzOSw4Yh4ZMn+N3sz1LbKOH0e5fnnaFmcYu9QHeLCL1JFp3ZRb5Nz4
	GY5
X-Received: by 2002:a05:620a:1a19:b0:8cd:90d5:92c with SMTP id af79cd13be357-8cdb59fe41amr594805385a.12.1773421712407;
        Fri, 13 Mar 2026 10:08:32 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:4c82:63a9:39e9:5c17? ([2001:1970:3847:e000:4c82:63a9:39e9:5c17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fda2c6sm583719685a.13.2026.03.13.10.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 10:08:31 -0700 (PDT)
Message-ID: <b3fa0aef-8efc-4c5a-8c9e-ee319b3cb0e2@baylibre.com>
Date: Fri, 13 Mar 2026 13:08:29 -0400
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH v2 7/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
To: Anand Moon <linux.amoon@gmail.com>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com>
 <f2eeddcb-712f-4a67-9687-e217f46f9ea8@baylibre.com>
 <CANAwSgSjsn46p13LokjYZBLdOrUBTFsmDNf80TG=nvkqHWNkfQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANAwSgSjsn46p13LokjYZBLdOrUBTFsmDNf80TG=nvkqHWNkfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2026-03-13 10:42, Anand Moon wrote:
> Hi Trevor,
>
> On Fri, 13 Mar 2026 at 19:26, Trevor Gamblin<tgamblin@baylibre.com> wrote:
>> On 2026-03-09 07:40, Iker Pedrosa wrote:
>>> Add complete SD card controller support with UHS high-speed modes.
>>>
>>> - Enable sdhci0 controller with 4-bit bus width
>>> - Configure card detect GPIO with inversion
>>> - Connect vmmc-supply to buck4 for 3.3V card power
>>> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
>>> - Add dual pinctrl states for voltage-dependent pin configuration
>>> - Support UHS-I SDR25, SDR50, and SDR104 modes
>>>
>>> This enables full SD card functionality including high-speed UHS modes
>>> for improved performance.
>>>
>>> Signed-off-by: Iker Pedrosa<ikerpedrosam@gmail.com>
>>> ---
>>>    arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
>>> index 414b03f5e6480f05f5d7eeaaa0afb4e86425ae36..361135269801f436703b6f1d768c91325a52f07f 100644
>>> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
>>> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
>>> @@ -140,3 +140,22 @@ sd_vqmmc: aldo1 {
>>>                };
>>>        };
>>>    };
>>> +
>>> +&sdhci0 {
>>> +     pinctrl-names = "default", "state_uhs";
>>> +     pinctrl-0 = <&mmc1_cfg>;
>>> +     pinctrl-1 = <&mmc1_uhs_cfg>;
>>> +     bus-width = <4>;
>>> +     cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
>>> +     cd-inverted;
>>> +     no-mmc;
>>> +     no-sdio;
>>> +     disable-wp;
>>> +     cap-sd-highspeed;
>>> +     vmmc-supply = <&sd_vmmc>;
>>> +     vqmmc-supply = <&sd_vqmmc>;
>>> +     sd-uhs-sdr25;
>>> +     sd-uhs-sdr50;
>>> +     sd-uhs-sdr104;
>>> +     status = "okay";
>>> +};
>>>
>> Hello again,
>>
>> Thanks for doing this work. My colleagues and I have been testing this
>> on an OrangePi RV2, and also a Muse Pi Pro board (making a similar tweak
>> to this patch in k1-musepi-pro.dts). To do the testing on my end, I'm
>> applying the patch series on top of 6.19 in a Yocto BSP.
>>
>> I've been finding that I see issues with the UHS support on my side
>> (this log comes from an image built and flashed to an SD card):
>>
>>
>> [ 1.072417] sdhci-spacemit d4280000.mmc: Got CD GPIO
>> [ 1.109741] mmc0: SDHCI controller on d4280000.mmc [d4280000.mmc] using
>> ADMA
>> [ 1.114589] clk: Disabling unused clocks
>> [ 1.118421] PM: genpd: Disabling unused power domains
>> [ 1.123249] ALSA device list:
>> [ 1.126[ 1.129949] check access for rdinit=/init failed: -2, ignoring
>> [ 1.133284] Waiting for root device
>> PARTUUID=e94bfdd7-a36f-4315-a480-476e2a12403d...
>> [ 1.176569] mmc0: new UHS-I speed DDR50 SDHC card at address aaaa
>> [ 1.180732] mmcblk0: mmc0:aaaa SS16G 14.8 GiB
>> [ 1.276268] mmcblk0: recovery failed!
>> [ 1.277351] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags
>> 0x800000 phys_seg 1 prio class 2
>> [ 1.286346] Buffer I/O error on dev mmcblk0, logical block 0, async page
>> read
>> [ 1.293891] mmcblk0: recovery failed!
>> [ 1.297289] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags
>> 0x800000 phys_seg 1 prio class 2
>> [ 1.306269] Buffer I/O error on dev mmcblk0, logical block 0, async page
>> read
>> [ 1.313522] mmcblk0: unable to read partition table
>>
>>
>> At first I wondered if maybe there was an issue with the card itself,
>> but by changing the sdhci0 section to this, I'm able to read the SD just
>> fine:
>>
> I used the same example on the K1-OrangePi-RV2 DTS,
> But it’s slightly different from the one you’re working with.
> I tested on the latest  7.0-rc3.
>
>> &sdhci0 {
>>            pinctrl-names = "default";
>>            pinctrl-0 = <&mmc1_cfg>;
>>            bus-width = <4>;
>>            cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
>>            cd-inverted;
>>            no-mmc;
>>            no-sdio;
>>            disable-wp;
>>            vmmc-supply = <&sd_vmmc>;
>>            vqmmc-supply = <&sd_vqmmc>;
>>            no-1-8-v;
>>            status = "okay";
>> };
>>
> +
> +&sdhci0 {
> +       pinctrl-names = "default", "state_uhs";
> +       pinctrl-0 = <&mmc1_cfg>;
> +       pinctrl-1 = <&mmc1_uhs_cfg>;
> +       bus-width = <4>;
> +       cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> +       cd-inverted;
> +       no-mmc;
> +       no-sdio;
> +       disable-wp;
> +       cap-sd-highspeed;
> +       vmmc-supply = <&sd_vmmc>;
> +       vqmmc-supply = <&sd_vqmmc>;
> +       sd-uhs-sdr25;
> +       sd-uhs-sdr50;
> +       sd-uhs-sdr104;
> +       status = "okay";
> +};
>
> Thanks
> -Anand
Yes, my mistake - with 7.0-rc3 it works for me:

[    1.071767] sdhci-spacemit d4280000.mmc: Got CD GPIO
[    1.110368] mmc0: SDHCI controller on d4280000.mmc [d4280000.mmc] using ADMA
[    1.115231] clk: Disabling unused clocks
[    1.119072] PM: genpd: Disabling unused power domains
[    1.123875] ALSA device list:
[    1.1268[    1.130718] Waiting for root device PARTUUID=e94bfdd7-a36f-4315-a480-476e2a12403d...
[    1.181158] mmc0: new UHS-I speed DDR50 SDHC card at address aaaa
[    1.185341] mmcblk0: mmc0:aaaa SS16G 14.8 GiB
[    1.198009] GPT:Primary header thinks Alt. header is not at the end of the disk.
[    1.202874] GPT:1134331 != 31116287
[    1.206388] GPT:Alternate GPT header not at the end of the disk.
[    1.212468] GPT:1134331 != 31116287
[    1.215993] GPT: Use GNU Parted to correct GPT errors.
[    1.221230]  mmcblk0: p1 p2 p3
[    1.529978] EXT4-fs (mmcblk0p3): mounted filesystem dbc76877-092e-4f8a-9f06-bf286309d8de r/w with ordered data mode. Quota mode: disabled.
[    1.540069] VFS: Mounted root (ext4 filesystem) on device 179:3.


In which case:

Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
