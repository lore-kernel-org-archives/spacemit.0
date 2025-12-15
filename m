Received: from cornsilk.maple.relay.mailchannels.net (cornsilk.maple.relay.mailchannels.net [23.83.214.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9E327BFE
	for <spacemit@lists.linux.dev>; Mon, 15 Dec 2025 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.214.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807128; cv=pass; b=RxeK+FsSz0nmt2kG4nfbzkAL7/dtJ5qTMJ0KR69e+OgngAzVYlQVloOrpEjJXVOaaAbL9bVW92BGCVZvN7EgjzRL6h/T7cu/nlN5/GZNytqLxdNyynjVmB3d6tpEHFgESv5f4LEV9sL+aoR3vwK8+f5nBddDZMJojdqzMlaC4jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807128; c=relaxed/simple;
	bh=otVooYX7lVYydZ4X+I5dszo4lkoMKYujB+BDLuLCxog=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=JVU7WEkkDGgzN6oUJSZ3Cr2z++gLXTI0jyQZKEpYIqOlCuk5vSXUi0yhrAKYfa4F6cXw4k4jm3zscFeX4yoedQLLTSxk22KKAGcYAGgS9DY5+SUO7MxAhLUCnUqSa6tf6Z+FTol5VWueVIpnJFjbJsHxZxe30QMdsG6cw3Oh3Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=CGMaqbMD; arc=pass smtp.client-ip=23.83.214.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="CGMaqbMD"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 48911801D2D;
	Mon, 15 Dec 2025 13:58:45 +0000 (UTC)
Received: from fr-int-smtpout12.hostinger.io (100-108-113-51.trex-nlb.outbound.svc.cluster.local [100.108.113.51])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id BD1D48003D8;
	Mon, 15 Dec 2025 13:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765807124;
	b=iunP80axDCTN3ndTayvpqBb4oDXT2BCkV1xczBXK8qHkuqquwxDVUFbwW74mgCUa4pbQEC
	zQVL+D5JaZvjgv4HJkAZ074xbPiFuz1YaRcX16IS09oVRQa5ja4NMTShY24sObGHTq/rmR
	Ex9rXUKxx5H8D18t+nNFrhNBePoWg7r80G8wSjtdRbS/YT3qit9+y88sEO3mGp9JuYkseV
	VVlZZSZiRquMIAko8YCeOz1Pun9rkg/MYTRSpb1IkR9nUGWB+EtZoqaqcsGkXFjZM0wl3L
	X4kiDKiaelwYKLq01cYlbnxQ7+Jo9EBjjv/rkrNtWeApbNIcymvs7JGSEQDowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765807124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=7apR0jdlQh68JBNJS0Kzie+uOx07+3csdNlfXBvqoM4=;
	b=eTDkUX8hciBrw+YgJ6uMydTou8BWyCUrGqkCMQUM9QI2uwVtqtvbbZXV1dK6Hw9OWNhJiy
	XYh5EqMsq2yE+UsWUWssJJWev8XImR7tblXBzskwo4vA7BKTw8bGezQmqxzToP47q7oe5O
	LcKNcy9qZz7X6/YcdkuLjTMBf/7zpxMxj4my6KPQqqEXvq5pH9pif+4o1ojT+1nVtessyU
	clATMFE1Qph65r5GxHF4sqNwLnRfEcSRcd4Th3sCS2DougpbuvbHVFNAPgjLnvGpGVhFqn
	zilA7nV1jaYomYCVIwcIOJ1fmGaFUDjoe39pwAG0KD+PElKkwYJlmJsmVmb7Dw==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-7gv7b;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Stop-Decisive: 64ea8f0331194735_1765807125175_3980996007
X-MC-Loop-Signature: 1765807125175:4184771881
X-MC-Ingress-Time: 1765807125175
Received: from fr-int-smtpout12.hostinger.io (fr-int-smtpout12.hostinger.io
 [148.222.54.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.113.51 (trex/7.1.3);
	Mon, 15 Dec 2025 13:58:45 +0000
Received: from [IPV6:2001:861:4450:d360:6864:9326:2fe9:fe2] (unknown [IPv6:2001:861:4450:d360:6864:9326:2fe9:fe2])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dVM9F1vjhz1xrB;
	Mon, 15 Dec 2025 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765807122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7apR0jdlQh68JBNJS0Kzie+uOx07+3csdNlfXBvqoM4=;
	b=CGMaqbMDJcq8MFuPxwaVG13FlF54jhY7ek8mzWB07NRJ3rIq9vppnBBesUwa1Ea73rIz0q
	OdIW/ma4P9dv1EGxfVq0gT4mSLXAJGnA4eG8wuPKc1Lgt036nDkPVFOFAR746SPtoHfXrh
	71FUq2VuyHtXRxWnNe7FPztogzDU9eNeZZ0UAsg8Xn3RlhgQbSQL5MtLy5wn1cuCj0mwJR
	nm+06P2x1FOmfx6dYRNQI1DIgGn/21zx3u5y6YpW1BxPXiP0E3/+0+pFrIFvnbrIyT87dD
	tttIkLNY7z7LFhV0OWcla25X0XxgWttDC9AUr96ZeIWSdJ8sIrj48TqhsfZqlA==
Message-ID: <bf815359-4b6e-4243-8a7a-6b00e259f4f6@rootcommit.com>
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
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MMC support on BPI-F3 and
 OrangePi RV2
To: Yao Zi <me@ziyao.cc>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
 <aUADG5c8r0GEN6iP@pie>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <aUADG5c8r0GEN6iP@pie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 15 Dec 2025 13:58:41 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=69401412 a=w3a6Hyo9sJ87gWsMspevqA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=asDJCzfm3GB8K8yUXNsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=MtV9mxeqUzM0PhnktY_2:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfHAxxhTFOsmXJazwYlkMl2VvC/NWIAnTz3QIjkn94KcQIsuoDXEI1/5C8Fx8hqz+sa4T4w7JJCrmTGqJmAq2epTIbF4h3geq/jO6N9x4gyqguRfjJgI0 /x1UhAcMjHVc+X2NaTuAC7p3IBftvhkQJYm+QELrNA09wW5Ms1Hx2qcEZH/PrrW7rz7QjwTXvqchwBmsDYdMW+71znxkuEVLw3badFrDHkBd7zHVLBX5tFTz nvOkEUY6zk588u35eliyaM+AGZIWeGBivbFxUYwkKGoD+W62gboEIql+v7sSQIHNbYcTjQrFmIy4549P1wAQVKNebYQFHs6PjS5yNep1JnQgJ36cMG4PHyjt nuFKAoz+o3TncRbLoJXMQbhFFto/Y2/S8EUhC9LIukwBAhAbpeAmlXViWFG1x7gznM3EJUUH2Ew94t3enN8cXK9QR0KNHAFpvbaaNTNoK1bgqND8g53cVHrZ XK02uvzTk/k7aRAvryMHeIlj6lV19F0D0DOHttizZaSzizNhweN4S5eezTA=
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Yao

Thanks a lot for the review!

On 12/15/25 13:46, Yao Zi wrote:
> On Mon, Dec 15, 2025 at 10:10:14AM +0000, Michael Opdenacker wrote:
>> This introduces a new sdhci0 node and enables it
>> for the BananaPI F3 and OrangePi RV2 boards.
>>
>> Note that card detect is marked as broken in the driver
>> (SDHCI_QUIRK_BROKEN_CARD_DETECTION quirk), therefore removing the card
>> while the system is running won't have any effect.
> This description looks suspicious: SDHCI_QUIRK_BROKEN_CARD_DETECTION
> doesn't break hotplug. It only informs sdhci core to actively poll for
> card status, instead of relying on interrupts for status change.

I must have misinterpreted the code.  I modified the description to just 
mention
that card detection currently doesn't work with these changes.

>
> ...
>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index 7818ca4979b6..a5b7d7c8c066 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -987,6 +987,16 @@ emmc: mmc@d4281000 {
>>   				interrupts = <101>;
>>   				status = "disabled";
>>   			};
>> +
>> +			sdhci0: mmc@d4280000 {
>> +				compatible = "spacemit,k1-sdhci";
>> +				reg = <0x0 0xd4280000 0x0 0x200>;
>> +				clocks = <&syscon_apmu CLK_SDH_AXI>,
>> +					 <&syscon_apmu CLK_SDH0>;
>> +				clock-names = "core", "io";
>> +				interrupts = <99>;
>> +				status = "disabled";
>> +			};
> This node should be probably put before the emmc node, since it comes
> with lower address.

Oops, correct in my branch. Thanks!
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/

