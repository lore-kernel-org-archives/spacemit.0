Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40A82FD68A
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 19:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767901558; cv=none; b=Sw/UxoLGxdI6fwiV4TUIMBiNho/aKp6DloYAOsZ/OsXHcExDhmH6aqrykqRXSqlt/wuvA7QPsTxKuIryCKc5hWRQ6ZXXh92C7zsedysX0Z8HZO2NQ+j0scwF3vY+1UjqNZ4Ud4XTAs7b77H+UaS9z4oZ1YsVy7gwe4mB5jZVysg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767901558; c=relaxed/simple;
	bh=RFSoiJgF2IhE1d/U2C8Dz/1A18MDcqAJmwzPHJkEPn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7ch5QWVQwNKP2ZrGTgptNC4BTr+IuGMXqtODz7RRsqGvUGCeE4uaASepRnyDpOVEUTNJiFNDIP/sW7JE73aHz+D0QO8nY5Ls4OaVKIak95SYd/I8WJD2Px+GV4Ry6n277J7u8IpHZnaQ7DKJIC9RGmtJSCwioYBkcuYZDWCW9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=M8BJfM7d; arc=none smtp.client-ip=209.85.160.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="M8BJfM7d"
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-3f9ebb269c3so1478184fac.3
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 11:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767901556; x=1768506356; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0eSk+8SweBNRYF6OiM3wD68xD/JtKcShoUz7XdjZrA=;
        b=M8BJfM7dcADh9sdfVpPjzfgd+YxyNkY7vVXmdLYrsxoP2wHixvgaIQjbE2is7fBsF1
         wNDn8Sq2NFOy9QrqMd4ZgfiWLYvyK2tU6O3wewkkIFuuzjvyMtZl06M404zlhERQnfb7
         q2mZAwKJFGsRVZrN9dw6PQwZtVDHrr8B+Huo1FXrDS5fpmEFNLM9edOQE6wTx4PtprBn
         1Ww6as0dP9FEzz3Wocr8hf2MhrGVgHvIZKHne+epL8Mv6cpz5Jy0KT6ff4wtxCgv0ACL
         0oddkgPgAGCV0IBd9icrl5h8DoQ8YCkZgA59YMDQb4yhW+Dqr5t0ppW9CrltziNEPE8B
         Z85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767901556; x=1768506356;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0eSk+8SweBNRYF6OiM3wD68xD/JtKcShoUz7XdjZrA=;
        b=bWW3XOMk/S2qZ50SalH8xHFEUkx3wa+/TyylF8rAsDkLkGX7RRThZWw8RkD1SnWNEk
         5KWO+b+j2bUOSh5lh2ub/tb0iedEtvFqkTLcrAgvz5F5wOm564DffPHzQz45LrO0790A
         U/OuI8drJSOMZPdB63l4/dHfwgw44u0tNzHCHPOtQ0vj04x8BNZmVWBO/5hHbcW2xUh4
         2YWj64Jqq43Rb96VbuQiftjh+4mNHgj+G5Uc3Z4xvjzraIt0O2vR0ZbIz8eRJtw6jWkK
         OFvIwO1dbPhod8UxDXrez0G0GDplRXvx3Ibib7MrltQ2eoaNz/24om+spMetAhxe8zjW
         EbEw==
X-Forwarded-Encrypted: i=1; AJvYcCWTKW01o/nelxzejyOuVeXZ85QofIqooxPLq6lS2aro2IouUG4JdFn0IrM1IENU/VAR6Wvm7RdJ4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwR15z77AOLOUsvq0X6eKWT1Yy5OpbTiJmYzhzBoW96+RssA5/e
	IeFJxBYnVzJRoHn9MeNFZgeshdiT8jolI6UaayFTUVhHSat+732hpgUVvYSPWTrdjUA=
X-Gm-Gg: AY/fxX5BCURoLBLbi+wL7eF9w1Z7NH+GrNXyOk7h3K6Wwn03I96YHUq2SkU52o8lREN
	2JafWSK5edIGSnpwPkCp7ddiysJ/+VDQs/k0YYAF9EYGbwYrMCRxKx8Oe0l7E51+vpbzZVec7A9
	2yCQkxgkOcvEDy65LgoT5ampz/igwSmLbIvLVHpeZ/8NzfWINNMlsBWbWISTKvIy3okLLZtZUoy
	730nJ7kamFUHFKIs3bXSP7K//Gem4V7FAwtGY77GHzdsejXPgYCI1pTdzy17LBQJMY/DxClJFXF
	JUgmJrh4RXVXyJHePztDBn9TgmwW0BnT5xOQ3O/wfoxYEZ5TfH+NS9FQ6cpq6Au3FrbWq7f51P1
	72jcg4FQa80h/ZnQlCfgnuF19d1ZAl2TzIZUTTe5Ew3v73nbikdKscXJfC6RUIVdEIvv0ufVfHh
	uCffZ/EMCerYsNqcKbTM3HZcPJCXk=
X-Google-Smtp-Source: AGHT+IEnGj7j78QZ6mRN19R9+RwSyzrulyek7pG3baJMhDCtKMbdCTrHEffeVpATRadsKRk6i4mUUw==
X-Received: by 2002:a05:6870:b3e9:b0:3d4:5a8:38ff with SMTP id 586e51a60fabf-3ffc09e5050mr3655803fac.18.1767901555789;
        Thu, 08 Jan 2026 11:45:55 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.86])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa507235fsm5688464fac.13.2026.01.08.11.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 11:45:55 -0800 (PST)
Message-ID: <4ebbe14b-2579-4ba6-808d-d50c24641d04@sifive.com>
Date: Thu, 8 Jan 2026 13:45:52 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
To: Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Rob Herring <robh@kernel.org>, Alex Elder <elder@riscstar.com>,
 Guodong Xu <guodong@riscstar.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
 <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
 <20251230021306.GA3094273-robh@kernel.org>
 <80e18a32-543a-48f5-81f2-4fa64cb8bf8c@riscstar.com>
 <CAL_JsqK8hRsVWV6WfbZ6hF1PwFfOJhyOrpWwoOhviAgv5ZxKUw@mail.gmail.com>
 <20251230-budding-dimple-c34636b0ca4d@spud>
 <05B0AE03-E7B1-4DCD-88D0-DCB9053F30BA@gmx.de>
 <20251231-grew-abrasion-dc1a9d34e632@spud>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251231-grew-abrasion-dc1a9d34e632@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

(Also replied to the v1 thread:
https://lore.kernel.org/linux-riscv/9504b2f6-12f5-46c2-ac74-826dba3fb530@sifive.com/)

On 2025-12-31 6:08 PM, Conor Dooley wrote:
>> Should supm be handled in the same way? Add it to the device-tree of
>> RVA23U64 devices. If a kernel does not support pointer masking in user
>> space, hide the extension in cpufeature.c.
> 
> Perhaps.
> Samuel opted not to add supm to dt when he introduced the other relevant
> extensions, so the rationale from him would be helpful but I'd like to
> get more opinions on how to deal with supm specifically. supm doesn't
> really describe hardware capability, since the privilege specific
> instructions are what does that, which makes me question if it should be
> in dt at all. On the other hand, it could be argued that supm describes
> a combination of hardware capability at the dt consumer's privilege level
> and is valid on that basis. Some wording like Zkr will probably be needed,
> specifically mentioning that having supm in the dt means that corresponding
> version sxnpm for the privilege level that the devicetree is provided to
> is supported.

Supm describes a combination of the hardware capability (Smnpm or Ssnpm), the
consumer's privilege level (U), and the software at the next higher privilege
level (M or S).

If the DT is targeting U-mode, then I can see a case for adding Supm to the DT
either at runtime or based on the known capabilities of the
next-higher-privilege-mode software. So it could make sense to add a binding for
Supm. But we still shouldn't add Supm to this particular DT, because 1) this DT
is not targeting U-mode, and 2) this DT is not bound to a particular version of
S-mode software.

> Either way, we are going to need something in cpufeature.c to imply
> supm so that it appears to userspace if the privilege specific extension
> is detected and supm is enabled in the kernel. The kernel already does
> the implication internally it just isn't reported as an extension to
> userspace IIRC.
> If we permit supm in dt, we're also going to have to turn supm off if
> the Kconfig option is disabled, but that's relatively little effort
> since it mostly (or maybe entirely) reuses code from implying supm.

It's currently exposed to hwprobe() but not in /proc/cpuinfo. This was based on
my understanding that hwprobe() was the right way to check for availability of
extensions. I'm okay with adding it to /proc/cpuinfo if there's value in doing
so, but I would recommend that the extension in cpufeature.c is _not_ parsed
from the DT and only enabled synthetically.

Regards,
Samuel

