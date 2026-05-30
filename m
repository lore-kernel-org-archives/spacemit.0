Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C48395AD3
	for <spacemit@lists.linux.dev>; Sat, 30 May 2026 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780129662; cv=none; b=SPB0vJyjM5rvVbRXK3NkdzfJhor7NW7HUGDfJktr2Wo9GByKuA8dUUpvNZu+FI7mgDck141xM2rTuNCwyhNd6TXLJhRV33IUgsCZTbwG/W7jhZWo9KkdEynwj0ofHGUkD+urwWpFBbLFrC4dOg7y49e64E9c0a5IsceIw6+/C+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780129662; c=relaxed/simple;
	bh=8X9UjEfTum+4mzdRr+694A8pmGM798NUYMH/9J/4quY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qGKUrA9Qssa9iXUOTi7iec6f5LgZXIKbTs7LxyG0YDBf7AYmoLAej7lmRaPmbHO5HwOAIE3f50ZrdtoPEwBjHXF+n1zIKu6znHXu9tmima2g++nY7tbiF5cLwQhNy/jNjGNmQmMR/RZxCYQefAsxxo762hRhyuiSevRgxiIbu0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eI9gl+Zx; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eI9gl+Zx"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so90481605e9.3
        for <spacemit@lists.linux.dev>; Sat, 30 May 2026 01:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780129659; x=1780734459; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qddz/zxZpUl2T8fFl77Vhtb+HfEDnwtpIpBzWfm1IYU=;
        b=eI9gl+ZxaVYdTrBqFuOxTYOT/xz31MHM1ciZc4XRbQJGQJjFSWEMfoG53UDJlKQbh9
         sFpzJtPbm17Pgrc/XM0hx6cWI4etV9bt3ajZZupXN8+/AeNuee3D34Z17JkuHVPGO0Wx
         y0nHGaJ4lv716x4Z03Cy3kQ7ezG02A3NxPKxhx9QvZQcZFDYNuRxiCbDv8bxA5N6WbXG
         4miECy3TaedxTwH0Q7rICW63H0EeyZ2CCPnVUZxoQacT97KAg/1RYgOjJ2DX/0YO6hFI
         6uOgbVIaiIUVFau8Yv2nADK9RR6wjit7iOVlLsnuoIbRRksx8ZsuaTVUM1Y3qhElPf8K
         g6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780129659; x=1780734459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qddz/zxZpUl2T8fFl77Vhtb+HfEDnwtpIpBzWfm1IYU=;
        b=Lma/2vYnkEqHDzi+xCNthfdcXpPSQBKSvjT7sdXg8r6eVF1myTBCDxvhnv45Ezg4wj
         roSwozVoGVFOag1tUdV+Qe1ybkf5tkb2tu276b3lwUKSDaWsKYNIdBeuDuOuvOYK2liE
         jGRp2DFCiiJp5xk853ibI9NjzLaQXZBkzcNzCh/ZVUHa6t9sqvkzVkuRmZfY+rNrSHLy
         xV6oSsfeEJ8q3vPN2MrlpLkHJwFTRm1H8QWlzbqso3FaPBYxluikAMjtZQyyt/B4aL1C
         UCM1m7e3TvnRfz5IbyBNTJxufAk/gfTunR42hjIZYgazvRZDWfI5xZAmbemKyiW9Gl8R
         LJuw==
X-Forwarded-Encrypted: i=1; AFNElJ9wCvHaKyQSB+pMScFoCDxbLriFZk2dRayl5DY9LNAUp3DFCjVjOquEjl+bq7GMhqGr6EOY/XYBEw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrJrKFN5tlfFSZUWjmK/4Yxeb62suD1e8Fh/k9bvv6iUZxCZ6L
	6kn0ZuDgWJ9p7cErDWjWdJN9Pkc85Mm7nAgl/5xF2RDMUPJq+Svm1zZZ
X-Gm-Gg: Acq92OFAwFPnNI3TkLKI7Imk1cSUk1qMTTH1TMTrD71h93uy4H8cP458eakK0NaTcDw
	KVskD/A2ZeAX5nEYEaaF+6u8+IXd+58UFXgEyf0ILJd59nAJ8XYIwbTGhgmuyeX+TflZzdsWsGl
	7U07PINefC0uUcAULHPkTtXjB+muASwujzgwfyGPcHGz3UEkG+0BEzV8B0i9y9USI3Pei47z35z
	QFY+llV3dgFygCv5F6NTDRQTNpcjsOnbRdSpkROFuST8b3Nh2El2bl0qlVIP1Oija8wKHj1Bs2j
	koc92zbOSdfRV8f9iXV9hUdJq1EGhcod0VvxVvCDr1hi+ajf9G0y6ApnIlExglpL5iQmAWK+pXe
	eGpe9t9TEdCl4WILw1r9dUVtJL7LL339j2TrYkW1sJeKuwlY6NwrJHmdUwvI72B2R9nUA/oGMw4
	WKkf3l6ZVXwX2Rse+c0HqhJ+Vi7Zp4IT6qLVOABpa5XitILsyxdAYMZXWy/bA2oGSsF+pqSQOh4
	w==
X-Received: by 2002:a05:600c:c3c1:20b0:490:9d1b:2022 with SMTP id 5b1f17b1804b1-490a2938ad2mr37014665e9.13.1780129658899;
        Sat, 30 May 2026 01:27:38 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-131-96.net-htp.de. [89.182.131.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0498e0sm42526475e9.0.2026.05.30.01.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 01:27:38 -0700 (PDT)
Message-ID: <1dc5141e-b43e-43ab-a2d5-a04069352941@gmail.com>
Date: Sat, 30 May 2026 10:27:37 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PMIC on OrangePi R2S
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlan@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, spacemit@lists.linux.dev
References: <20260520100000.575719-1-amadeus@jmu.edu.cn>
 <20260530021021.1167953-1-amadeus@jmu.edu.cn>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260530021021.1167953-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chukun,

On 30.05.26 4:10 AM, Chukun Pan wrote:
> Hi,
> 
>> Enable the i2c8 interface and add the connected SpacemiT P1 PMIC and
>> its associated regulators to support voltage regulation on the board.
> 
> friendly ping

nice to see how all the k1 dts files are progressing ;)

Looking at the two opi ones some bits are still missing:

rv2:
- i2c8 alias
- i2c2 + eeprom + onie,tlv-layout + alias

r2s:
- sys-led
- i2c2 + eeprom + onie,tlv-layout + alias
- pcie
- qspi + spi-nor + vendor partition layout

You seems to own both, do you plan to work on that?

Best regards,
Andre
