Received: from crocodile.elm.relay.mailchannels.net (crocodile.elm.relay.mailchannels.net [23.83.212.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0253624DA
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 16:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989326; cv=pass; b=am+v0jIQvAh40WsaqWBKIubOtbVLU/vERBGM4UNkPWw+RjLmhc1Gu6d3dJbopHWrzGwJxIry8XQ1cZlhAxUUDaw5GIXp0bblImwLZyYUsMNW/R2dacUSJ2Ec78aP3wozkPNbotX7mZDOdfoDEE86k9szcxgToIjCFI9yFqF8RU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989326; c=relaxed/simple;
	bh=vAKgIaU+X9paSlve7THIrmq+IeObGtjhN82q/ODdYU8=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=aEoQzItb9eUjyHwcFROtLwwTsRrBRfp3ugxFmpw7Bc8gFN5YeVkEoqja3PUegPSkccHbSzaeMx7D9SBpzfmMqLEbPgG5yyMxSI+9u4rBIJAe9vtxkKOHJJd7qxsukhLKihqVPpzGQkztURteEQQFp7Z9YTP5gnEi/EuralraKQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=eVt23TGZ; arc=pass smtp.client-ip=23.83.212.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="eVt23TGZ"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 4F5966C166A;
	Wed, 17 Dec 2025 16:27:21 +0000 (UTC)
Received: from fr-int-smtpout20.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.102.46.124])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 98A7E6C1CAA;
	Wed, 17 Dec 2025 16:27:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765988840;
	b=L9PlLRGPEnzk7YHWcyT6X7RjwtzvQO9pUrjquf+iljYcGFw8AA0FXkCKJg4rHmf6SDsMz6
	k19ufs5GBLtOjVJImUS/1V6aLTZGCh6LlNgnOaUfHcQLseG9fwOk0ikzPgLkrN9iM8iIFQ
	zCWkDKWGe83uggrFY6AicVxUCNJ3R+ydQdNasJ8bOg3qaZn4fdkGQ7UXbwyjJTUqAFBuDV
	wJcdTK+VEQBxlrd+g3Cq/bnKawU1R6jWAzyRTj37FGC7mPEF++lPMFFW7APseqEv1N3Hzd
	TvHb5/WAawIYu+0bb56+4y3g2T8tDu/5Oq2aHspuX/Zxhoucnff1ziEk9SLyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765988840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=HesHKB42sFWNJQ5/1X2yY6xy5sS1Ov54zhb41hgpzz0=;
	b=BCZxs8UzY+4jAJ61pqXduxbmg4vTszVG2seHA3iNN0Y4J5oLX3oubxJLuj9SoHAS/FnlKq
	xogUqFnf2eaG/EksQvGb09C10W2Sez2spoXLFtBYaRi2zhcF9Pw0dGruOYhdg9jgMBPSnq
	gCdB8y0xp0zwwNdGjqA7r6vyA0fyuSHVi3+EHnrMwYoLcV9mtxcwpRFkMn43nCLbWh8Q1A
	QBKILBwLiz7XaMFeOWmScqio8A+PpmWY7nzJc39tq2EXpyyV1C1glYbsrIhhbqmjB3zAan
	mc/k4xmzdHpOoQ2Nn64Xq0VW/AEq3yv3fBOHkZGP+/tp89Ufte+rOgyv358N5Q==
ARC-Authentication-Results: i=1;
	rspamd-659888d77d-sr5hm;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Supply-Tangy: 0cf1f2df6c746367_1765988841132_287769992
X-MC-Loop-Signature: 1765988841132:2795846280
X-MC-Ingress-Time: 1765988841132
Received: from fr-int-smtpout20.hostinger.io (fr-int-smtpout20.hostinger.io
 [148.222.54.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.102.46.124 (trex/7.1.3);
	Wed, 17 Dec 2025 16:27:21 +0000
Received: from [IPV6:2001:861:4450:d360:ea5c:9c0:3076:4dda] (unknown [IPv6:2001:861:4450:d360:ea5c:9c0:3076:4dda])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWfMm6Sctz1xsp;
	Wed, 17 Dec 2025 16:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765988837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HesHKB42sFWNJQ5/1X2yY6xy5sS1Ov54zhb41hgpzz0=;
	b=eVt23TGZawB2y97GYqDSAzzLSoXsqQcbZgflFR4vwVkBUxSpSrBSMpgZJwpbfIam7TmJ6k
	tP49w5lfmlVoqltS/WPGMbYbzBBGw8cB1zb70Kp67eLP81h+JSP6ks1iOJLwZeTpnvZbYw
	fU3XXUvva1KwN/oADrW0QcpStABCKbIU+SplAaS+LjNejYLgN8VBQCPkFm8ukX3QN2NbN3
	RAHv/TgERv1cVZ5mCoJkNuieR0YYsTqyvxllyjoO9wGIJ5hJ5Kp3DwKSuDvXf/uOII0FrO
	Jj05d/kZJe9Gr90LLWR59vbNjFt/UfgYk7ztQkksR1Y/MCBskbAJ/Xlgs5a9jg==
Message-ID: <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Yao Zi <me@ziyao.cc>,
 Yixun Lan <dlan@gentoo.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie> <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie> <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 17 Dec 2025 16:27:16 +0000 (UTC)
X-CM-Envelope: MS4xfDNTpKG25UZkQm4iWK6CybzQxmpJTvMOGFwlt336RKUwiMUuzwoAE7vMeZQ/OH5Ys+t1SCKQcLHKiqBI452Z8rfb09xlACExv+XIcrVjKII8Nh8DCn+o ee82UVRHBDu08i2q3kg69fKLPlXpjEJVFEoR6Tu1xZ3hqYORZ+/LT9P1YcqwW5VCADfmY9wtT4KGYRNgKpJPEem11mmPnYHAqergdmoccOGl8n3ll8jkZ8yW 0GrW1aoUYG3anTDeNhnEMjXpWgEkMkndhPRzaCQVxmPmRD54skQJi5nC7nTFy1y6nwuVX1O/2nMe9ShsNbIYBnQBgg38Zn7qXtWNa8MKWTCY4YlRp31RUDEM PeodOFJx1yy2uzjV7cBNrl+f/aNwsaIwR2chodpYXkL4X6n5wOEBGaSb7E6rEaLqY43QqIiMNJ6qeYbXNVgjP+T85KEni11eyJgu5n/7CiBCxEoshotBdlIN bUqUQl0SvhGZa35k3r1JTqwW/qdZ9UlOGGi3xQkn9DaD92cjmsqN7sNG3L+qx/SBbU3Rv9T79oSdMAvn7FUtjgWrFGfIsu0yp78Bkw==
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=6942d9e5 a=MKCPbgLKPPUpDiypvfdhzA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=MZO-bCNrfHEazIZX2iAA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Iker

On 12/17/25 16:26, Iker Pedrosa wrote:
> Hi Michael,
>
> Based on the discussion and Javier's feedback, to make the SD card
> work properly, we need to patch the driver to implement the following:
>
> Define a separate compatible string: the eMMC slot has a PHY, while
> SD/SDIO slots do not. We need to differentiate them to apply the
> correct reset logic (skipping PHY init for SD).
> Extend the pinctrl driver: support is needed for switching the SD
> voltage pins from 3.3V to 1.8V.
> Add tuning logic: this is required at least for SDR modes.
>
> If you don't mind, I'll start working on point #1. Feel free to choose
> any other task.
>
> I'll post a patch once I have it working.

Wow, that would be awesome indeed, all the more as my time is quite 
limited. Please do!
I'll have a look at other aspects if I can, like USB and PCI Express.

Note that I have an eMMC module if you have code to test, and I have the 
BananaPI F3 too which also has eMMC.
Happy to work together :)
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/

