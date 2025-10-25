Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F31F12F8
	for <spacemit@lists.linux.dev>; Sat, 25 Oct 2025 07:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.252
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761379109; cv=pass; b=mp3fzkeCdc5riAXRIRaKche3hVMMZi7DbOQsg+4wZqrlyDd9pMh74nbJHVSRNeB2wexjZfwJycjt8q0HSo7v+kFt7LNV5vS/5xAiP5nl5cFrkmSghsgWdWDfu6inf7jOJLLz7eLVhXTeIRplI1ysXQh+laWU0VS1hR9QZylARK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761379109; c=relaxed/simple;
	bh=LuJtYVNpf2PB0l7RlPOBAO59fruXbhIGSxU68SUdxfA=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=hteBNLQhPuy7DbN/5P/ERnUkkCr0u/Y7EYkfVWDbiZQa57LbPCFIyFkaJYwMbQOAOHA13LO0BhnB9GBLPzqL9zQjQC3BkX2uC5pX8zXHuxy7Dj0w2xrKssyzF2LVgxaQ9Bje7s+1z8+roSeRa7n/Qp+yxajuzkRpeI600v43+IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=JN/XYHGH; arc=pass smtp.client-ip=23.83.218.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="JN/XYHGH"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CDEC01E0C7B;
	Sat, 25 Oct 2025 07:48:47 +0000 (UTC)
Received: from de-fra-smtpout10.hostinger.io (100-117-123-159.trex-nlb.outbound.svc.cluster.local [100.117.123.159])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 085DE1E0B92;
	Sat, 25 Oct 2025 07:48:46 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761378527; a=rsa-sha256;
	cv=none;
	b=ap6c+FofTy4NiDzMNMj0WnCvCxn1XGaZMpWOjbMYUuXreS+lW/gbur/mBCgUvN5+JZ9pqP
	ZiIufN5T4bEdf8OodQyW+FpcDlaYw7sr1kAAhMaZQE1AQSg0eXHh1FMBha2mMej4iNrm9v
	8ZCz/xzhzWNKYRmDLbyut7hHFOGstkTJpCqKb6X9KiEf8ukiDW5iSIawnYduLYTRJQ0wUg
	BMJeQbgqwIfA3xW2A/cJUNlx+agdIH1fw+JoelAm5DRsCRpyojhdVr+Z/g1EJCV5WLsONV
	MYGR/n6J9Oa2TUf4a7PY+zKKTnU7jx0UHF0sY0nH/Gv/DRpqdGUA2bqqfvHOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761378527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=POjhoP6+yZK3al+4v1y3f1yAM6WcGqS/Or0wJm35+NI=;
	b=3SW4ZoAYksclTHLr0CQVn0sFRzDHAx63lM9dIZHgfgHA8wgZK0IzHA/Phr3J2CfGDigrlj
	61hCO2tnTb7XiH9mJRt/bfrPTuPCc3JyTU5kMTZOepPf/0demg0IolVKwsKwwN6uxEdOT0
	K8v96NJ6SjkQEgBBOOCkaMWHwI6WYhc6LtbszR+imgkTCNwnECI8m7Bd26Bg0o7YfCM4LL
	iehyvZlFvKoOP/JHxb/85JsJxf281UGYFdhs+DOJzfEEotMrdiCED0T3GNMKripz5ypqe8
	LKgjevHc2QFWxvweB5d2uF3mYc63hv84tnwRXzcokr3pGQcQ8XfSFZlAUafQ7Q==
ARC-Authentication-Results: i=1;
	rspamd-9799b5d46-fkg64;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Bored-Tasty: 751f2f920fa9fedd_1761378527712_791440598
X-MC-Loop-Signature: 1761378527712:755428982
X-MC-Ingress-Time: 1761378527712
Received: from de-fra-smtpout10.hostinger.io (de-fra-smtpout10.hostinger.io
 [148.222.55.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.117.123.159 (trex/7.1.3);
	Sat, 25 Oct 2025 07:48:47 +0000
Received: from [IPV6:2001:861:4450:d360:8260:6f14:f559:44de] (unknown [IPv6:2001:861:4450:d360:8260:6f14:f559:44de])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ctsMx18L5z3ymx;
	Sat, 25 Oct 2025 07:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761378525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POjhoP6+yZK3al+4v1y3f1yAM6WcGqS/Or0wJm35+NI=;
	b=JN/XYHGH7543CGsYy+AVeGmL770drsQw1er86/bvW4rIfS30iLmKiPnBsLvv/JFkyR5VuB
	6roGC3VfAIjYe8+d837GcXqS9Z7VdCLBjlpVfl2p3FlTmdeKRBEhJFX6hCc08kIkqnUR5t
	SbkN6wiuD89c7XWZAFX4PgkikFMbaiMCltpcapH443as1SGcpHOR25dq7VB/luZMR+CjaJ
	zeCgeZBjXqCVfOoGGDQgPfjcKMUjR8h8Dl4cFLc2oeIjaZIkvA4h2J2NDwIHAr/FV79F5g
	ZGOpE6xGayyxntStrImzcddlRC7htuSCycIccbaGixl9lEN3sIREih04Q3RQ7A==
Message-ID: <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
To: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Sat, 25 Oct 2025 07:48:45 +0000 (UTC)
X-CM-Envelope: MS4xfNbsPdM62VTveJLHS0nVTVS2xxaYXJ6YdW6ajWNdp/mA0kbdYO+BGBUhFm02m04YCKCThe5yJYR3xnHcl+AlWj+K0trd5PN8iDeBwHcVRLpI+OoTGl7U 337g9vfVrYUr5a5ZDAs6oDAaB0kTDnJ0peJLUDbDEjcEmg5CebN8eOC9vQNcZU8fK5jhudVRUHPFN2y1SFgktQXGVojal6Kj1bk5FtPw5NutmYMXzSvZ2fgZ ZpGo3R0NucpsUqcr6b3ukJnslKtZh5SCsKxfI8rjkbes7WihQznaX9s3Sh+FKAlIONAyVHioAaTJ31jVrwdiGCir1JkjJnQ60CXMp5E/fs21TAvGm/YTJqe0 PgiBz9YUtw7gKWltfz3q9lRHYuWOPiRakeb4+roaflJk/FssNEpHzBUwQvJxZ44xdwLCgiT1
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=68fc80dd a=rByZg85q4TxBe4aD0HbSyg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=-a8RYutpcgMjrEULmycA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

Greetings,

On 10/25/25 09:45, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> The OrangePi RV2 board exposes i2c2 and i2c8 buses from the Spacemit K1 SoC.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 41dc8e35e6eb..c4b25dd30f54 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -17,6 +17,8 @@ aliases {
>   		serial0 = &uart0;
>   		ethernet0 = &eth0;
>   		ethernet1 = &eth1;
> +                i2c2 = &i2c2;
> +                i2c8 = &i2c8;
>   	};
>   
>   	chosen {
> @@ -81,6 +83,18 @@ rgmii1: phy@1 {
>   	};
>   };
>   
> +&i2c2 {
> +	pinctrl-0 = <&i2c2_0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&i2c8 {
> +	pinctrl-0 = <&i2c8_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>   &pdma {
>   	status = "okay";
>   };


Unfortunately, these changes are not functional yet on OrangePi RV2, 
testing on https://github.com/spacemit-com/linux/commits/k1/dt-for-next

# i2cdetect -r 2
WARNING! This program can confuse your I2C bus, cause data loss and worse!
I will probe file /dev/i2c-2 using receive byte commands.
I will probe address range 0x08-0x77.
Continue? [Y/n]
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:        [  124.675321] i2c-k1 d4012000.i2c: i2c transfer failed, ret 
-11 err 0x400000
                  -- 09 [  124.686769] i2c-k1 d4012000.i2c: i2c transfer 
failed, ret -11 err 0x400000
-- 0b [  124.695584] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11 
err 0x400000
-- 0d [  124.702945] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11 
err 0x400000
-- 0f
10: [  124.710346] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11 err 
0x400000
-- 11 [  124.718221] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11 
err 0x400000
-- 13 [  124.725607] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11 
err 0x400000
-- 15 [  124.732994] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11 
err 0x400000
-- 17 [  124.739480] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11 
err 0x400000
-- 19 [  124.747480] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11 
err 0x400000
-- 1b [  124.755108] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11 
err 0x400000
-- 1d [  124.762500] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11 
err 0x400000
-- 1f
...

I assume the i2c-k1 driver works on BananaPi F3. Any clues why the same 
buses don't work OrangePi RV2?
Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/

