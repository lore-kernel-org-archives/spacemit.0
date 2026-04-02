Received: from black.elm.relay.mailchannels.net (black.elm.relay.mailchannels.net [23.83.212.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378B83161BF
	for <spacemit@lists.linux.dev>; Thu,  2 Apr 2026 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140491; cv=pass; b=QNoRpea8kpp+ikoCmDaO3OJGQsKhlAjCbtoTGA3UYJufXrzoqFjyqCqNkTdeII1W1FLWmlDJqI9JVWIlFFVdEh/AfV6JQw18byZd033VvXrTkie9gPFzTLUn4hNoscEmg0u3itofYlNrKo71o+qrKb3cEeev5e2K6iJWymWOnOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140491; c=relaxed/simple;
	bh=zNuuXrkfz3JvVz0uQDp9DtTSygXzdrle98D98LD+psM=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=lvk0mcUO3gn0pIAMrtfrezLUyNjif+XlK6blK3oz1k1Dl7+TmymwYRaINQrv1WGlncuQhNrd5fwgW0A4wZhezrY/5eRxO5/H3rEiJ2CJ2LSykmhpfqUkfjW4ltgR6KX4PP5G+5O9K6FbUib/AAWEvHFLdLvHE2kwCVnp2ykziiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=q4KTQIfy; arc=pass smtp.client-ip=23.83.212.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="q4KTQIfy"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 789127E25A2;
	Thu, 02 Apr 2026 14:25:06 +0000 (UTC)
Received: from fr-int-smtpout17.hostinger.io (trex-valgrind-0.trex.outbound.svc.cluster.local [100.118.167.158])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 464F17E2DA3;
	Thu, 02 Apr 2026 14:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775139906;
	b=RWqIoB6+6ZEG4sfij5TSKrx9k+g72G6AbqTorKbpUbgRhzlKAmBZq+yggRytt+S/zGTttI
	mU1k1Klj3lBhDpQXPyUhFGf4kf1C68ZBMeQH7I0u0ztFKvuAZ+iX4Jz+hP+CCNNanGzbq1
	Xl/ZBC8C/kj6qJg471nIWmMtRPyPUKxSFBg8EwPb5uSLCfVeA/HofcxK4kQNH+/OIBny/J
	SaYOLVI8qFwe+s7dMUB1kCcRiWZWIpmzCqQLy1VijlXseoa8U94kuyIXLC/q1kPRSXL6fy
	jyuQy2bV63Dh1aqRlxnnl34XPC5b+HT+lPI+8bltnJtKUTgeVnKYz7DoF8FkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775139906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=iRsEpdPW7+SIeBtY9Lplguj5RbobZmydSNjJFOfI+O4=;
	b=MUFVqgYpVXEE53t9Ue515uIDlxhIt0CqqbqkPw8SaMc2z056wtRwSRs4kr/L6KywtzF75+
	lgXuJygnhVRyA3Tf7mh6HchsE/T9fB/IFKuKBrUd/ZTAkIiEjo0Wx7ls9MmFXlmgdt5kAU
	ZG6C+UBwAj4yhaF1IjolDrfxiEx//Q/gNeACwLLFznyLkVdHDjrgyjpexNTWwbpDN733Vk
	eEzXzbJecAp5VT9zxnCNWliOPXEikERBujIcFS6bvhkUJ4H8e345e/o38TX0aiytinRuYg
	5jj+CrKda20+boD70YFhqjItJMFbJi4S4T92+/GM/RtrmexLIeO0EstIh3oNuA==
ARC-Authentication-Results: i=1;
	rspamd-7d86dcc447-5m55v;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Obese-Bitter: 5647d20a77c26db9_1775139906302_1133818014
X-MC-Loop-Signature: 1775139906302:1529237009
X-MC-Ingress-Time: 1775139906301
Received: from fr-int-smtpout17.hostinger.io (fr-int-smtpout17.hostinger.io
 [148.222.54.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.118.167.158 (trex/7.1.3);
	Thu, 02 Apr 2026 14:25:06 +0000
Received: from [IPV6:2001:861:4450:d360:ab76:cd75:446d:1407] (unknown [IPv6:2001:861:4450:d360:ab76:cd75:446d:1407])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fmkdc4GyNz1xy6;
	Thu,  2 Apr 2026 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1775139893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iRsEpdPW7+SIeBtY9Lplguj5RbobZmydSNjJFOfI+O4=;
	b=q4KTQIfyV6mUv2D/mHBqapOxdrsBRCkQQAiVGGhq8sXnNutVACh6xkk3wtFjk3sBF1Bgr0
	vy5HAWzmIg35efgKzMrS4m7KjA+1hS6QYujMmVgo3oNaKUKdd/s60N2w+PWvxKhIMHyJYC
	5n/VFNFGIS6wt45syfV1epnOh6aNtejwa/2RvtHoUKiC/2f2gqYiKY+Wrukd4dU0DBZ7SH
	MwxhgfzGkmaQ5jvTwFaz4jEZzfxy67QZ/p+4fc0meYWh4ea+s2QyZdTE3REzsm8HAU6tT2
	xLqg9Ott98cdQygJZ7MkkIENEQ4uVq8CzFjRLIFggmiSCV0VjI1xYAyB1jF9CA==
Message-ID: <46e715a4-0fd7-4692-9a25-a44d469b17b0@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Rob Herring <robh@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/3] riscv: dts: spacemit: enable USB3 on OrangePi R2S
To: Chukun Pan <amadeus@jmu.edu.cn>, Yixun Lan <dlan@kernel.org>
References: <20260402100007.110201-1-amadeus@jmu.edu.cn>
 <20260402100007.110201-3-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260402100007.110201-3-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu,  2 Apr 2026 14:24:52 +0000 (UTC)
X-CM-Envelope: MS4xfPDXEePllkhuoeqIL+DyxWKIqpegzAhCFxiofxIqzjZ6A0uiNW1WQtYkvmLegmBzTWvino8TuCvKMsrdzpihyWjP6c6/PplqLSIVnFpqPdYabSbnWP1a yMBkLSCR3ES3xmlhYHtYGDa4jKEB3lTpkCSKWyemIZYWBW/+xeCDaZyU5g1jdUlq34jYt318xdRZranLSIcqsGMvETt8VGWTlBdUEfUctWdsuOTea5tQIVZ2 8RDpWIY0VM3b6Sw93QIlsrwyJMl6fr3Oi/Y1oXCEUsczGV33Y3pHuKLVfO5tY1PVaNLKba+TcaKpNJV3DSFbpi0sc+WI75BxZWN3Q5gilAwke9AHjRhbQ2ic cxebfG1+lyBMXMRZly9TQ0OT7T4qu8qqOLw/CP+9Uh7ANLyMF6mxexJIpci4ZRuln2wbbJT9M1A5SqKCppH9YfhmsL+ApJk1+60MV8HBZ8uH0ga6/QOqqHqc ppjRQ3wuX89LFRABo/gAlnvX66y6+aWJnbu16f3702xcigjnAcWLLxkG/z5NDBYzOJWln2q7xA6CmAX76hDxWY1oOuNT3zwndHxFiiW3CEo7OirSj3Bi/4sR Wbm029XthwTpHNFsj2m3jtBbB20fw5E3UpQHTFv+qTS/yUiQzqGwDEDsRRsXwlqi6TlIYymVzoWRe7zDxr2vzpn3RK7QQGYYyk/JB9Nd5OmkazhqOU6pV2Me GMvI5FlKJxEq8Jl5kgBi/xsqHqNuHxup
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=69ce7c35 a=KpaUJEZuatzsP5AJPIWeNw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=uwRAlWvI_YLGMtlX8kEA:9 a=QEXdDO2ut3YA:10 a=QaCz1EEGLN5M2vlY9-U9:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Chukun

On 4/2/26 12:00 PM, Chukun Pan wrote:
> Enable the DWC3 USB3.0 controller and its associated PHY on the
> OrangePi R2S. The USB regulator provides VBUS for USB2 and USB3
> ports, but the USB2 ports are handled by a separate controller.
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>   .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index 409a6db269ae..bc68721e6263 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -40,6 +40,20 @@ vcc4v0: regulator-vcc4v0 {
>   		regulator-max-microvolt = <4000000>;
>   		vin-supply = <&vcc_5v0>;
>   	};
> +
> +	vcc5v0_usb: regulator-vcc5v0-usb {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio K1_GPIO(126) GPIO_ACTIVE_HIGH>;
> +		regulator-name = "vcc5v0_usb";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc_5v0>;
> +	};
> +};
> +
> +&combo_phy {
> +	status = "okay";
>   };
>   
>   &emmc {
> @@ -109,3 +123,13 @@ &uart0 {
>   	pinctrl-0 = <&uart0_2_cfg>;
>   	status = "okay";
>   };
> +
> +&usbphy2 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3 {
> +	dr_mode = "host";
> +	vbus-supply = <&vcc5v0_usb>;
> +	status = "okay";
> +};


Thanks a lot for the patch!
Would you mind sharing your configuration with me (in PM?).

I can list the USB 3 hub, but I can't see the USB mass storage device 
plugged in the USB3 port.

# lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

Thanks in advance
Cheers
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com

