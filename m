Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6F93749EE
	for <spacemit@lists.linux.dev>; Fri,  4 Sep 2026 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510058; cv=none; b=MMXDVeguWQiqGRGHmdZfmZJ6yqyy8rm8RAeHIZ/If/yqw6+BqnWczoS9/e6jrZ46hSTyoAvsr41ZPW5fTrneiA5RsCBeYkZdRBrcvSV8FNc2gaP2juuEdU9MuyxfYcYtyLTb7DrTKAPSFrZmv5lqzvinGOlR85bt3dQo2W4/r8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510058; c=relaxed/simple;
	bh=oyDxmpF/0rXv8EzH2b2HV9ktlFAjPfgd1vY1EFEf3Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9Oz9Z6+V6ZbXayWVw0+UVMRCj6zhjuVwdfW8vog06/q7oBRwYf+5y5X2UdrRPzrleIjc0jg7t8kHIMcuDNYcMybGgqU6YRo7CIQ/cc2TL+8lhVxAUSr+F4wIgI5ldDaiFLgBvrRpbdecgCDBFjNtnSOKybfhuwhkgTwxsLTeRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1bcd9e00bso524459eaf.2
        for <spacemit@lists.linux.dev>; Fri, 04 Sep 2026 01:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510056; x=1789114856;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Hg5enr8UVGmoY4IFaKJm1CFD+8hJCgKWPLT+95rrjA=;
        b=hdfX+FNuxPs5Y/icikdIeQGc3LouYXRAJ2DCiNLwReFvQjlD7fSHui3ERerMkRIxW9
         ozodnaS5QA4ZbiOWVL4b8k54VnRBrnULvGGthkpG+cxmUT3HmkX2Ln3oRu5zyrxxJn82
         83plu9LXDPjKYl+6aboLRcRoSUBB01biQYqin94l6F9P6yHcbOo6/4eXxP4cH7Xti5AC
         veTDgBLgRteaDM2ZUgULkCxkldjfnQdIFqnNyARN0vBhT+AX2bcTLiDYsupH/PTbLH6l
         xXdOTAFUPTAPNRQqH+6btme4Ipq02dIncY+q39+J+g1SfdbsNF8//+dM22amzkZQVnUM
         Xalg==
X-Forwarded-Encrypted: i=1; AKwUvBybWBBSablguAOAVGUn7Kknbk2zRJ/Hdw31lYoKLHIzBiqM7mUPjK/b4LPT69ZzUdfCP3fKxSS6bw==@lists.linux.dev
X-Gm-Message-State: AFuF++lKolbuvS+M07NbCMBrgqpCw09X0xY820qU9kh0Vgkn0dJH+lsX
	Ktp8bvUZsTZh/IOiqTYxYba+Vw1EoE3Zed04Gz49CNV7PawZ18Jk3Tb70SZx/coeCAc=
X-Gm-Gg: AYBFou0eLuKFCjFnRAUckVh1Ep8UQ7ZRJfa78rZGI5Vio82KLjHTipeeVouUgc5aS2w
	vzyNE7wNmibx9S83740n2mvaudtEbHY2EWgq5vaWatqBjDq39sxGW26+jzNDY39KPX5O0kMCu1A
	GaVa9DXc6ldeWQNwbpNdNlkLYLPjM5wXW7KDTNRHORYnQKpg7LZVNPWeeEAUUNb7TTS0Lk0I2OA
	C7s22hLXu4fcL12jxiVtLlFyfnfLUTiOTfxgMpOVh701UrIw6HeUrwFgiR2SaIwN9WWZFikNF1m
	25jLBHedURT3nAOW3Z/kmDixl+Dl/Q9kt68xEQf/rTSEi7ttXqqHywwTMhtgDG6c4oPNktD4gIi
	2Q5gJkxqtCHeX+j9VRSK12y0r2jR4rRWu4f516FPt6BgOKkS1Zvu1f4hF+W5X6ZaHw9J0ykQ2/f
	0ZWO7Pu8UW1M0DiVzRUlQ+fdCD19Rz+jvGh4psfD31vewxMG4mKTa6FZe2yj6k5beMUDyf/44t+
	pwHrk5flv5sZfiEiydDE1LeyA==
X-Received: by 2002:a05:6820:221c:b0:6ac:a5a3:460f with SMTP id 006d021491bc7-6b6fc6d1c21mr3254748eaf.25.1788510056043;
        Fri, 04 Sep 2026 01:20:56 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6d53db6ccsm2635478eaf.0.2026.09.04.01.20.55
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:20:55 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f4e596e393so719259a34.1
        for <spacemit@lists.linux.dev>; Fri, 04 Sep 2026 01:20:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx8QzoFs93W7qN57OhfAAd4hIFp265kMVsRxKaIWTJKfwByEox89XCAZqUCTIoaHSjqEEjHtYMJWg==@lists.linux.dev
X-Received: by 2002:a05:6102:534e:b0:77f:fb50:8822 with SMTP id
 ada2fe7eead31-78a4a9106f4mr984477137.7.1788509665014; Fri, 04 Sep 2026
 01:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-23-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-23-s-vadapalli@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 10:14:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXHwWKu_oqNQBR=hytL0JQVzMsnVWyBueds5PHDJWmWg@mail.gmail.com>
X-Gm-Features: AcwNN1UYeUOEoTpTj0vmkU4IKRIpHFGa-g95RrL_FdgZr5R39yo0yU6G4UOZ8vE
Message-ID: <CAMuHMdVXHwWKu_oqNQBR=hytL0JQVzMsnVWyBueds5PHDJWmWg@mail.gmail.com>
Subject: Re: [PATCH net-next 22/33] net: dsa: rzn1_a5psw: Remove comma after
 sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	linusw@kernel.org, luizluca@gmail.com, alvin.sipraga@analog.com, 
	clement.leger@bootlin.com, justin.chen@broadcom.com, dlan@kernel.org, 
	rogerq@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, opendmb@gmail.com, 
	andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, amadeus@jmu.edu.cn, 
	kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, horms@kernel.org, 
	vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 06:41, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
