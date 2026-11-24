Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795492027;
	b=dzKH4QWpjE/ELJSMzwkIhcTYH/F7r9M369rS0em6C4uzaVqS0zcCaWexSQvYVoBNaoBL
	 mBidRfZhgnV++ik+xx7g7c8EJ+PyFQnP0OUYcOxippWsgzq84qHgTHtfTpfw8czqdj9uB
	 QmVQylACXYrxAOrQ9XPz3P1tzeaBXjNROeglrSsYRoVQQy+p7QW1Z/0YQymQgjaU0aw+P
	 BcEEmCMULMoM6IpRhWAB7a1mvcIHyRJiVLFxZH8kWSE68JudaLmsuKjslNo+ciuJiwTB8
	 MwvDwZGZZJUcuYMQ4pIbX0z6BGEqw/mshGqcaki6LZt+/202PnaKvVzvdsTjzFaM1FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ZlBXp4j95Fesrlj5MUpmODB8sCNBYo55Oy0NCx35Ro0=;
	b=yIjOjOSKNIny0eit2t9jAV8SPTkj3NHfk8beb6KzgEtLH882WwPSpV8K/cBuMZ5rtG02
	 NcFY/XIwe+6JoBkIPyNOQBy2XXg6xuhMOLT5F0lUfFUl8dO2nNeu9qSTMZ0Xes3QcDe7q
	 3oMa9VFO7+FpY/zqgAWwkwTZYIdbtQpllLqwbGgW8lGVYUAwOV7lW/eZV/O3nBUbbFDoa
	 AloO22n/hviuzmiQOD8FFNk7qz305JMAjXhcRRYqM+yciLW5hhECDog8pQE0iTsA0iDLO
	 kwQcfgtn6keOho/F1AK0iL0eMwS/HSSTIFV3iP1rFFjnTpI81jfP7FvnY3dYUgs+c+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pFO1XuE8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0A9606A31E
	for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 03:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B0A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pFO1XuE8
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9213922de73so73757136d6.1
        for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 19:47:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795492026; cv=none;
        d=google.com; s=arc-20260327;
        b=CNU0wzRz/GZn6k5zC62evJsEFyVBfP7DcFd5LFqO3lPu18hj5b3ll4D0a4suIzHp5E
         DU5H3jLrqki01zO+eVkWKukV1CwdevQoUcnUEu46AwhDh6mPhNNyhaAfvSfiv+Yl7UsY
         5V0NY3siRbDlYnw5GhO9gMX5c5LPlknQQvTr/qheZbkV2mLqwTLhVNZy5AsJmP/FBHSr
         FrWttboCLAjMVi+hjs1zL9BoEd2ddTZ2XaTgo/antTu4io5COhY6QjvMAhejsR37hxr0
         ylvLBqg5m77m9fgkebSnbi5b0Qoz61nsHO+sLlyLh21MwUEXUugNI0Ykraxm5wgNAWXf
         EwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZlBXp4j95Fesrlj5MUpmODB8sCNBYo55Oy0NCx35Ro0=;
        fh=uw1c1g9vFyf6w7fzdi3YRW/nS6KXsfkVIn2GK4VckUE=;
        b=I6jNo/Ea7FHtbzpfN9SIqxCICcFsmPu16DvMe2rFnM5NrBuj6jURkTGJkEoceuFCOZ
         rcQLhsqhClYfoAxYxY1il/XEQ4qap6F7fyJlJFA1vCKd/P/hsDo5wdGzbiJ9VQQv7pEF
         2s8JGX95AzKaB4ir0yfGP7D4Xs6JEgL/muAkNCceYuFTq3TrAxp1JAkyYBVVBgGElFDo
         +AWsPmXHyPDp82eZ5FxPNU0VlXOEsNTNjZCpOQ//7cLpuwe0g+a+uqyvlP/+5LEwM+rw
         XP9OIWXWiwBQSza1wUFS8STXAUflQIdt+hv8kK/X/qBlMibQTzy+wykKzlgqhXoN/MdS
         pdYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795492026; x=1796096826; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlBXp4j95Fesrlj5MUpmODB8sCNBYo55Oy0NCx35Ro0=;
        b=pFO1XuE8xGmCjwhrumbhj2mjy+4G+/FTc3f3RTJ75kw4p458/Vojm1trigLpgi2RxX
         z745FXhpkFnp8ywV4bpT1n7YY7Vs3FID+OXXL4UDLyHL11eYE2TVNjo+Qsx7ohiOPZeW
         I2I+zp9y1BZa7Csil8lQWmWM+qpVr/QUHrPguriuUXkbFXn8Bp4vhrcbcxZygjPMIewm
         0qovJMpriZbHDveUM21vIOPpC3xQve5xQFEgoq8Bpl4XbhWSVdvmPNWuv3PAKJuylvTS
         O33B70/gao0SzHUsHPGCZxTFmq3pfT2Okxu0OxEuuX7nrrtf5yAndYcXPWp7j67mf5qJ
         HxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795492026; x=1796096826;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZlBXp4j95Fesrlj5MUpmODB8sCNBYo55Oy0NCx35Ro0=;
        b=utzAGIdKObd0kpoULLUgchSwG11YY0QbwaxgDO9syE/Fg/wzkYWdETgKPwIMoI8oan
         Z6tLHKejvAMyChhn2LN7u+h2Xj97xuLXOYAsKtTURbh+XLWihDGv3XZ4olMsbt4f4coY
         +1oop3BJctyxWkM4+EiQcXu0WctT/vkfRbtB6oB6IFs4mAW0L/d8D1wQQ37i2y6A/WpD
         xa8MUHKE7S+y4Cp8WFlidHhKCqcR2rLJCFPPWqPw7AqFO9VnFwuidq+c1/fC6nyiKryu
         p1O/HtqyP2LqSsMBIOtYC4vOpFPBf77VygKLrpWzXNcUKvx8qSSxVBF8kfeZNg1U3XkK
         k3SQ==
X-Forwarded-Encrypted: i=1; AL+hErFLLWjWHMzjIYdl4dItG1eFL1ELUT5Lq6/+LDjGWWlI+j+UcwsvOuamLf/Xlyuw4Z79PQms/6ek3Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/8KqmVrdSGJ+BZR0XWJ94+HM9exMjtgozlGxl/cmWw05ZS2OwW
	9hWP1EvfPv4sLZllInlcQtfgfMG+e/ObrKgsQ7vH9TOj0BmaTe+4DDmK7WE7PMMAs/ib1Ty+155
	UIoKLSs+U8ObfXwn87HJ+NE5xK5g+qdU=
X-Gm-Gg: AZFdTZeM+I8E91jnS/9PiG+ypjyRZ20YezSBCIoUhi4oaNu5ZD0JSEn9YlPLh1w/aXx
	53iD8uhahlH+GozZdlWoHOO8xU5+Ud6YfSO6yrLr8/fw+qkYe7RkKvI5FBcJAbu/uSoO9mnElN3
	z0HHWgtXa/vPJcNrWBy+h/wpFCi7Z0KNDLOYWJV05p574GJpPy7l81j6p7cCyiZbLeSbDcHII3t
	/txUwxlv7eZiEkZa8XCkpeAM8EER7KfWBvCn+6qv0X6g/2tx18e46yuHr/m0KyS0TOPRppq36TZ
	8QH4CrlMGs7L+xr7cps61VMdZ6e8sooWUijiu1nmb1ptCXCjTHHeSKFxXzeLhHLCexSBujPjoAd
	H3zhYWIBSZO921BDBiiKtnihi1TDPv42jQvCLklhF53HeEMYksLaDZUFoez5x/NEvhmWy3JB0S/
	2f0yabm8ic6KPddkE=
X-Received: by 2002:a05:6214:4e81:b0:91e:dde3:f213 with SMTP id
 6a1803df08f44-92134b0e48dmr208910266d6.40.1795492026210; Mon, 23 Nov 2026
 19:47:06 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Zhi Long <longzhi@gmail.com>
Date: Tue, 24 Nov 2026 11:46:55 +0800
X-Gm-Features: Aa3M54ovvCtFZ2UeXOS2b1TVyPsCM_DsKH4Wi3KQVJPC-xM1QpPppfUx76jRiWs
Message-ID: <CAGEQorPo=UkuF-o5+c7exvXzaj4uudM_f7ek_6GnSumMyYngdA@mail.gmail.com>
Subject: drm/spacemit: K1 DPU and the K3 display series
To: codykang.hk@gmail.com
Cc: dri-devel@lists.freedesktop.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Cody,

Thank you for the K3 display series ("drm/spacemit: add SpacemiT K3
display support", v3).

I have a question about the K1. I work on a device with the K1 (a product
built on the MUSE Pi Pro board) that has a small MIPI DSI panel, and I
would like it to work with a mainline kernel.

I compared the K1 DPU in the vendor kernel with the K3 DPU in your series.
They look like two generations of the same Saturn design:

- The pixel format numbers of the RDMA layers are the same.
- The bits of the pipeline control words are the same (output enable in
  bit 18, the video mode word 0x821).
- The RDMA register block has the same shape, moved by one word.
- The interrupt names are the same.

But the layout is different: the register window is half the size, and the
control, timing, composer and interrupt blocks are at other offsets. The K1
has its timing registers in the output control block, where the K3 has a
separate timing block.

Do you or SpacemiT plan to add the K1 to this driver?

If not, I would like to do it once your series is merged. For now I have a
small local driver for the K1 only, to bring up the panel: one CRTC, one
plane, direct register writes without the command list and the DPU MMU,
plus a driver for the K1 DSI host. It builds but it is not tested on
hardware yet, so I do not send it now. I only want to avoid duplicate work
and to learn which way you prefer:

1. Would a K1 variant fit into your driver, for example with a second
   register map and a second back end next to dpu_saturn_hee.c? In v3 you
   removed the ops table, so I am not sure which structure you want.
2. Is there register documentation for the K1 DPU that can be shared? I
   took several values from the vendor boot loader without knowing what
   they mean.

Thank you,
Long Zhi
