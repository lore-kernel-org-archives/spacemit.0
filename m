Received: from bird.elm.relay.mailchannels.net (bird.elm.relay.mailchannels.net [23.83.212.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09B927B34F
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 21:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765920654; cv=pass; b=hFUFRvFW4nVn8+Aztmd8oDrvozz6mC5Z+OymBkUDCuoFnk8MHLrcWS6T20vxwTWX1GaKlI7+RlC9OU1Hx7paVEuhluIxkQrJVucWUfvgCoGG0CbZMiBCNMHqBQyWtbLLz1i2fjOlA7O0CG5/7qKoMTgFWQqXyjkbrZ2SQSsMjqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765920654; c=relaxed/simple;
	bh=dCUni0eJKjnuCaMXSa9Q2MsE+zkkGNxDV9VhRkE+4xE=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=ISo1sBJ5vNSQC8raMGj/BF7d3l2SOI48diQo9X1nLRE5LcVQRukqjQmu5kCMBQrllZO7l2JMfrIC69ujzErjufMzZGCNY+JkKcNgRPRGf76hV/SLuopMHU7JDKgptztO0hO7grxQ2moQjXTl3HY3MGjlSbBf27v2AbzvrQKF97Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=UKNLg8pX; arc=pass smtp.client-ip=23.83.212.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="UKNLg8pX"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 16E19562335;
	Tue, 16 Dec 2025 21:05:42 +0000 (UTC)
Received: from de-fra-smtpout7.hostinger.io (trex-green-9.trex.outbound.svc.cluster.local [100.103.179.169])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6DEF8562715;
	Tue, 16 Dec 2025 21:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765919141;
	b=7zXKCUAiR/HEYtHw/fHmF7isW/YMJlOIfEy9DAPMAlJvYBFEJVTYgkR8WezB1vo3I5dn5K
	ge0wZTUkyEwBuDNUI/V7Bl1bN45qsnEy/RxidhIVmkYGBjWUGxUFywR3uEFqwQkqOCmY7R
	daYuTIsBIzEaSSmvS+Sxe0x+S52p1Gp/pXUc23TjtF0mb0vjSzkPgcOZmP9JKGctwlW8d/
	8j2+nb/kcwbnNltslhTSUUbYKvM9PXo13fymaL7nFhS+BQpkIyySAB9kWdMAGlJsv1VN+o
	regFnlS9Ktzv0XXTFEJNTZsiPMsVbDRWT56U+ljHVnC1PLN8a5UpuvUcXEkORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765919141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=eTIrfuDhr24TI2lSZux/GGADITfOggiET8mFqMQX6js=;
	b=iYhltbd72EvbW3HUkySf3Q5A5zdV6WpJz6Phdgrhs3Y7X5s8uHXgoX71Gg5385Hta/nBMS
	IfzGY7dqiiRndr31/PXusnppO59C3O3wOZGno8d1ze00Cofbri53+6Kf0PkNb35R/MfgLa
	IG066Paa82g0j/k2IUeWXNrt2rEczWFRzKXnJZ6VbGpgTzMz6L6I2u/AfAUPDqitlC95gh
	IYJvo+Wg7gJkRT8e/UjE992aaj4o1X9YFaW+I408KLA9ayayJv8pAubNqYmtNj1YvA1eM2
	esNBsZGmTpFFVpGbvYO3HJEn0K2blVBu5fjhmYADoZnnzl9SeRlcmMkbyn0aHQ==
ARC-Authentication-Results: i=1;
	rspamd-659888d77d-jcnb4;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Abiding-Cooing: 063ffa2f50f88687_1765919141814_2820594378
X-MC-Loop-Signature: 1765919141814:3717057727
X-MC-Ingress-Time: 1765919141814
Received: from de-fra-smtpout7.hostinger.io (de-fra-smtpout7.hostinger.io
 [148.222.55.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.179.169 (trex/7.1.3);
	Tue, 16 Dec 2025 21:05:41 +0000
Received: from [IPV6:2001:861:4450:d360:30d8:94c5:9529:bfd5] (unknown [IPv6:2001:861:4450:d360:30d8:94c5:9529:bfd5])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dW8bP3ypjz3wjX;
	Tue, 16 Dec 2025 21:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765919138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eTIrfuDhr24TI2lSZux/GGADITfOggiET8mFqMQX6js=;
	b=UKNLg8pXXoeAuakJeFqoK+ULNQZRigp0iHQY1LrOcj1LlyjCNmZa/LoXXs1IZ9ew6ZEtf8
	CmitUHZfOlGgEQxWkOW24iJIV4t7HTyC4EIDLVlPoZAKKt/Ph+i5NFYN99koIyoKrHVQxw
	FUvjTXQ15UTztak95hzfioMkL8V9XOARENY5qaciTSowv0orteZEjLwUztLKCRPgZj5574
	0NH1ETZQuL0xM9ozgK6NaIC9YBerVgMiGP9IT5f9Gzh8c/s1bWvosBT6nEC4yXI/Evunrh
	1O3Apw6Y/zWDNXJrgrfJ/Eaxban5rpTixlLwKLWtpmWci6ducINCtiqOE3YBKA==
Message-ID: <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
To: Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie> <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <aUDwDkd8k_4gD1yc@pie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 16 Dec 2025 21:05:37 +0000 (UTC)
X-CM-Envelope: MS4xfF5Vy1L1KouG49QIlLe5kFFaXNS6TCn6EH+qUk1Sff+7pUTB5PALKx2/986sedZ/CpYlJBEMbNbEqnJGpcWbKwcczUoTHni66kVNztVM/R7p0sglBT36 CSkRnhk3RJfH19FzmLnZ8Tr0MsCqFvusJ5Ipxjm5YhyAwvdsiBNMw91oU82GVtWgRjzJBgxvXtdfh9432MU6siiFl4qIXC6/iqNQJGU1laDfeiyeVueY3lPS u8OMRNJv1OmnNOsFunYZU1370GGSNSsaPgu0/IwogzSzPftmpXcSzBf5mcl8+1rST5OHM/ldHIvgMc76gzmJWcI8B+QjfpUEwlNqRL/q9/EokhoHNJqX+o0I H4/08Z0UKHie0MFEc4dekOiCwfL2uH0kPDVavoRMfrs+JgKLRG4qS70nlCXD/vGkykHPkQa2SKp36XiX5zKYRnjddJqUaL/EJ9W8MTDr2s3QHR5nnMwTktOG S9WrGF8kLnZ1JTw6QMEkPnc9hiAmZFh+jNTHqEfdZTmw2XvBQYi/icN9qQo=
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=6941c9a2 a=txFWH1vTMWaEHP0dv8CF8Q==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=lv0vYI88AAAA:8 a=d70CFdQeAAAA:8 a=VJnbNgQhEQg3sspumF4A:9 a=QEXdDO2ut3YA:10 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Yao

Thanks a lot for your help and tips, much appreciated!

On 12/16/25 06:37, Yao Zi wrote:
> On Mon, Dec 15, 2025 at 03:00:52PM +0000, Michael Opdenacker wrote:
>> Hi Yao
>>
>> Thanks for your helpful questions!
>>
>> On 12/15/25 13:58, Yao Zi wrote:
>>> On Mon, Dec 15, 2025 at 10:10:14AM +0000, Michael Opdenacker wrote:
>>>> The OrangePi RV2 board exposes i2c2 and i2c8 buses
>>>> from the Spacemit K1 SoC.
>>>>
>>>> This declares devices present on such buses, in particular
>>>> the at24 eeprom to store MAC addresses and the regulators
>>>> attached to the PMIC on i2c8.
>>> This series is named as "Attempt to enable MMC on SpacemiT K1 boards",
>>> what's the relationship between MMC and PMIC/I2C bus? You didn't make
>>> use of any regulators in the second patch, either (which seems wrong to
>>> me).
>> I expected that declaring the regulators under the PMIC on i2c8 was enough
>> to enable them, but I'm happy to be corrected.
> Declaring them doesn't mean enable them. Regulator subsystem maintains a
> enable reference count, and when it downcounts to zero, the regulator
> gets disabled.
>
> If no driver acquires one regulator, it gets disabled after 30s since
> the regulator subsystem is initialized, see regulator_init_complete()
> and regulator_init_complete_work_function.
>
> On BPI F3, SD is supplied by buck4 of the PMIC. It's marked as
> regulator-always-on, so wouldn't be disabled and then cause issues for
> the SD card, but this doesn't mean it's okay to omit the correct
> regulator supplier of SD.

Good to know!
Surprisingly, when I add this to the "sdhci0" node:

vmmc-supply = <&buck4_3v3>;

(after creating the label, of course), the device and its partition no 
longer show up in /proc/partitions!

I was hopeful because read-only mode already seems to work, but maybe 
indeed things are more complicated.
>
>>> vmmc-supply specifies the card's power supply. And if you want to enable
>>> SDR modes which mandate 1.8v IO level, vqmmc-supply is also necessary
>>> for switching between 1.8v and 3.3v.
>>
>> I was thinking to get started without the SDR modes first, to make sure
>> basic operation works first. Would that work?
> Yes.
>
> FYI, for SDR104 mode, you may need to implement some tuning logic[1] as
> indicated by vendor driver,
>
> 	/*
> 	 * Tuning is required for SDR50/SDR104, HS200/HS400 cards and
> 	 * if clock frequency is greater than 100MHz in these modes.
> 	 */
>
> Though in mainline the eMMC on BPI-F3 already makes use of HS400 mode
> without tuning. No idea what happened here, or it just happens to work
> well.
>
> Also, the pin controller on K1 SoC seems to have some undocumented
> registers to select the IO voltage of SD pins, which should be adjusted
> when switching IO voltage[2].
>
> I think these pins should be implemented in the pinctrl driver, then you
> could create two pinctrl states, one for 1.8v operation, one for 3.3v,
> and switch between them through pinctrl_lookup_state() when changing IO
> voltage.
>
> The last thing to mention is that the three MMC controllers on K1 aren't
> same, The one used for eMMC is the only one that has a phy (both SD and
> SDIO controllers are marked as SDHCI_QUIRK2_BROKEN_PHY_MODULE[3]), thus
> have different reset and tuning logics.

Wow, that's surprising. 
https://developer.spacemit.com/documentation?token=WZNvwFDkYinYx0k9jzPcMK5WnIe#12.5-sd%2Femmc 
doesn't seem to mention this (though I didn't check very carefully yet).
>
> You probably need to create new compatibles for the SD and SDIO
> controllers instead of re-using spacemit,k1-sdhci, and write correct
> sdhci_spacemit_reset() for controllers without phy. This is probably
> necessary even if you don't implement SDR modes.
>
>> Would you have board examples to recommend, with an MMC controller operating
>> in a way similar to the one on SpacemiT K1?
> All sd/emmc controllers work similarly... you may want to take a look at
> mmc-controller-common.yaml for common properties.

Right, I'm already using it :)

I'll be patient and try to progress step by step. My time is quite 
limited these days, so everyone is welcome to try and make this work.
Thanks again for everything
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/

