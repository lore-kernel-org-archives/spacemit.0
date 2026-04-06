Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4633A392C4A
	for <spacemit@lists.linux.dev>; Mon,  6 Apr 2026 18:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775501146; cv=pass; b=OQ+7Md0czS66KftdVIv/GgfuVpmgioXz/bb5Q0lLwk8cZy3umB8Vi+b41b/3cwyVSmotV1Rxkk5aeqR0h533vVS84xMnIE1/nTFFOUlnwU0/aEonhAoWJOg5pVtG+AYCMQFVa9ucDhVEeK39UWcm0pXQQJiA5s3TqHjxU3FJpxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775501146; c=relaxed/simple;
	bh=9pmHTV4TADk0gWWUpG8M/E5ZGSDVjZD7cI5hHNpdlIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbhYPTY/eQhz8kDPKeIatzf/Zd3BUguGKr3onIkCSltjN+fSi0SASNCVEXdyGw+E8lFtTCESRnvvusSv/lzHNwG6WwSYy86xbfMtmZDq+hjQb/Zq+moMHNwNEV7xgJXAZiw4UvHYiahijBJz0Cdn68DgjpL+eS7VzzKxyy4RsRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPq5lSAC; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPq5lSAC"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66f1ef0e1a8so1532343a12.0
        for <spacemit@lists.linux.dev>; Mon, 06 Apr 2026 11:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775501143; cv=none;
        d=google.com; s=arc-20240605;
        b=RDKFEPTIN0wRjA4bFG/RhXiB03bTttn959gWbA7tVtnLyQvkoBLNQBu/nqhnlTG7L7
         C4WzNGnmkNFw+k87zAu9ZIIMsNTIqWx5wXzDVVEYPQUMCLCQJvUjaMepdAg8IM2SocTW
         +zpKGjywffsc+KkqbpicDA7WpD8xaDm6KrUsKlHyZIUi4WmKwTFhbyFD6lb5s20t8Qbi
         eMk/r5+QbU2po/fobjYl2vG1235h/Ev4P7lE+njrpQlO/Qw/mKIdn9sg6G6NNAmISEpC
         lggbInCHgL/4HjaK2PNCgt2Io57N+Yr5V4kz/akMZSMGLYoo7RcUaBrmqNzHp4/9ouj1
         XJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9pmHTV4TADk0gWWUpG8M/E5ZGSDVjZD7cI5hHNpdlIc=;
        fh=GQVlO8OlbBB0mqvFV96gCfebOcrgf0SCCi/m1gEbNxE=;
        b=BRGaF+gvrguX2Mhx3/IQ+9ZxaLBoWSlEQawfOytmRLsPbiQSe8YM7ONQLA+/QZbToG
         WH5Y0BPc0ZuV5eurdJ6eZUmTOgVPvCHpO5s8fqG1s9IrhjEgo+8+9xIDbFzEXpcqKLwK
         t0Xz1jN19qwgvb9ThnGfByC48nsuQ7mwY0F4X7jjqC3NXz2yiQElE4kof+RfiWzpuhra
         cPHMS3fd2GqQldqh8u9dXXt5ArL7k6WLnuG7UDk0yLVvz3pjoh7THim8GOQSjGwCnOr4
         OSl3LIPpQ3nWBUA5j+E+uLvY6RDzaFlpwNpnD+rSE/slncnKJFWuhprNzSjymTzCWC7L
         I6ow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775501143; x=1776105943; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9pmHTV4TADk0gWWUpG8M/E5ZGSDVjZD7cI5hHNpdlIc=;
        b=UPq5lSAChvSZ5BQbFKvDSNNXenFXR6D3EzBdOl3SpCIR7ZZDvWxw2tHlDHG3oYAT++
         yit0cqbr1K7zVYJE82MGa/kBqRf5XXsRUeUWj9V6UbC0r1CqPxLt72xBGi0f1c4xpKlQ
         O2t/G22rS44LY4ZDB1GZtxOSq3MkpbPetDhe3eibrmFD8Rg8yrn5KxoyaLl7lXycphG7
         v+ctUQrWOMICiV7f21CFFoCOnZa+fdLHUcyy2hboW9zcFRbibhkKCJK6Ew1H1YjQqdAu
         Vzx1wfOgUL4Rx2RXSCBAaM0nTtBfHBXjuF+wazGrRH/I3f5kMzXjFQrjRV7S9M0O/pTQ
         szsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501143; x=1776105943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pmHTV4TADk0gWWUpG8M/E5ZGSDVjZD7cI5hHNpdlIc=;
        b=kCYoE7UjPQB+l84Gsc90a659pjbcTmbnRLg6wtCpQaxrBzMeLDjRDg8wuAnuguUoyD
         V/mfzdfeoGKOr35+qgmTV4j4WPw0TAVFKOD3z9so1LKOiuR8DSAbzzQox1Ao2jLLf1yW
         D5EFzrdItwDy8ZTBJ3xYPg0698sULIxdH8ELyrFrATEZgol74fHH5a1nDnXHQAdhlmMr
         Ne8mYCaKDxpLl7WmCznxmowfKPScCoplLHRrGjGYdTybxtil0+CAXppYQAf2CVjiY9JP
         qtBtWDd5k4x2++V2fyG9bfwTHBRf5wjXpDUvoLDqAXHc8Jiletiz71dfIKX+ODwj1+6W
         OpNw==
X-Forwarded-Encrypted: i=1; AJvYcCXvWJAQVNOUD274tsJFm4VhDWh269AMDhGvUrzelav9hX5dcgmCuHmMDcdEWqurFcnhW6g7QILi/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ0Vt1UTpYfd9Shbk3UEI5ChVWe+7tEr39sr3KZNO2B9k0/Xxk
	xhARTWbAI00poloU6lJ+u0x1qN1bxcGX1qrRuaAomdMTp9JYFjv5TieVRF5vA+0GxwQ09qz12j3
	6ll/B0H74A86xyOxsB9r529OJ1mU9Xdw=
X-Gm-Gg: AeBDiesjtg8xHuq/zUad5KhGxhJqWvW+XtE1Cz16ZqOMvZDCR+AHEGSo0uFcohP/C+j
	W9w5Egye/1//P6TrYFy8U6kRiC5elHN1+9EQrLpLkIeRjR3C/YYQk/udzzNf0ghoobnkijFzG/i
	QJgJiHRsqk6VpqZatl4vh8F9+6O67FFsc/EslkYC9y6e1njTyYqX95acLEJWNzCLCeHP0gSQ/AJ
	3gvsCWHt63UBy+geKuBpVK8aLVKaATgAPRaHXjEAaBRzRIfu1hfhTYXIRh/z8HwJkB1G2tRf95b
	ZJ04rQ==
X-Received: by 2002:a05:6402:a215:20b0:66e:4372:73e9 with SMTP id
 4fb4d7f45d1cf-66e4372747bmr4169926a12.1.1775501143298; Mon, 06 Apr 2026
 11:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com> <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
In-Reply-To: <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 7 Apr 2026 00:15:26 +0530
X-Gm-Features: AQROBzAP5CclShOimKNLKPr2Da3Hb2vm1DFd1fAAdE9Rewzt50idvfVsjIHzHvI
Message-ID: <CANAwSgRUM0HJSKr2zLYkv=LnWv85gvbc0_WD9gXywQqHcU=EaA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] thermal: spacemit: k1: Add thermal sensor support
To: Shuwei Wu <shuweiwoo@163.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shuwei,

On Mon, 19 Jan 2026 at 08:13, Shuwei Wu <shuweiwoo@163.com> wrote:
>
> The thermal sensor on K1 supports monitoring five temperature zones.
> The driver registers these sensors with the thermal framework
> and supports standard operations:
> - Reading temperature (millidegree Celsius)
> - Setting high/low thresholds for interrupts
>
> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
