Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264D3346FAD
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 04:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768883316; cv=none; b=E5WDaLSmxCtXuYmHw9yn7BPcp101oGId03xD9eztQ7i8xIXun9KOfqFASNlKiHIfrFzfLC9BGDj/zXtA9IkInJy0xCl1VXDdEOrRqoGgLLzXen1w1u+FFlI7N04v1HHSR9sjIOdLKl7rApgqZ/UM7KvA3rM2x1T4BFRT59WrVmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768883316; c=relaxed/simple;
	bh=n5A0OXSyk7lo7f3jHURyz0bX/5X3lYhpTO7Z9MO/Uec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADh9tB5sA3HwIamjsQxdtovVfWv8mrTr27HHmWor4h52fwM/CTSsJKznpsCxUF82db8DQ/dECK++EdnuuO+Wz/CabgfZoh78WTp20EV5Nzfjx1jcN0DgkBze67vtTWBXRIPV64yclQ9KJQyH03KzlPIbgDzj2b71Yk0PweBUZds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtkFVPIb; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtkFVPIb"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45c838069e5so2965783b6e.0
        for <spacemit@lists.linux.dev>; Mon, 19 Jan 2026 20:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768883311; x=1769488111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=OtkFVPIby11ndno9BhM7DgyuIf0rRW6bvauyk4dzjSeq6zL4EIwrEcbr1fSof57ZPw
         ZdrNicOZnrKYHLBs1gJEEyLiGEzIuQTDlydmSh8zHlSqbJuHHPceWX589QYuAWyIV/1k
         NezEDoAyE2rE3T8GIVgYmyvE2qAjot/zJILXpMBg2QorFf0W7HcRytb+/TQH8uZEX4Ln
         gALORbKGM2TzwssMBSI6RM77XxWn5IIQgFnii23hG3SGNTDjF2tAgM6eNi/3wdH2Ldkg
         l/4t8bL08UnQagDKJpfswCjvvmoQvuoBDeQwOv0V/wDP6YWQ/Ml+YP27eoiin1YCL3FV
         bq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768883311; x=1769488111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=eEQJsJVX1qmw1TJj30d1Z5oaNcYJRkuahVvW41mpk9uddIImSCcfHSaxahaVbDb1WY
         w3x2POy06tEGR3G4zp5PFYGEQQgnHmakfK1Ru/YRBbEOMbV+hfraSvHLR8GztMmN9JOk
         f2BrEX+dypaXy1OWE7KmGmP+D4agzXYRuQN+XZMwxCVvydbikzzC0tqxjAhcb8Jlqdan
         VaZHq6LHV5irxBRS1i0i/kBA9eNxjzY3PBe1q5sh4SGnHygf8kRIXKAaitObOLQxeTj2
         Xhw9RYenlDYyGsW1GfTh0KEsoQZBB/HoFK/WWPbScCTnKKSfRiTF9KHRG9ZV0aZABWd+
         OeyA==
X-Forwarded-Encrypted: i=1; AJvYcCX5ZfkDw4rnIUPwJ3jvMbNswnVuf4X756/qpHXqWBQYJgBd56jMMBAu40AFTTQUct5wcWOFjoTc8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVOAyex9Fu/P5hXr3/1NTXPqmJCxQXqnB5Wyo3WcnSAL6n0qOL
	G4N3SxUE6OmxZLX+cXEJFMKuB+8Q6BHrqpONf9QSpggrqL98aFFyvlii0TAlYxs6
X-Gm-Gg: AY/fxX6cTCbaEIA61hUHjMcFhfjfHucjYKwIm75kCtKcNAMQCRaf/gpyQKfjT+Z3GkD
	Aiku617G5AWkofX9ZNgMwwNjTn8gyTEyGpATZGWyVQdkdLH1yqnjXWY5qBbQ0dnloJzevk8PAOd
	CBZtBwV/ZvLI3Zpj7a1zvdS7oPh9LzUbXjaxh+mj04SR9dczlpBn5jpBAFDtcahDH8oXpJFEJql
	O0U8Jxh0emdvJZIVH55uRCbJZgy8iM71sKp6k3CTJ7VvJBKD0qL+eKzCsdot7iUgMZUQoysncX9
	tb5VLhlxVa2270BRZ7danZq5kLKLFZjR/ZrV8zn9PFNaFQ4f0us/hzkIzEKZ4HA59RSCEVRsSR1
	z6GmDp7hqOmA0b+jyr1gKAEnHHumYCB5kEvNDpDIwFqOJxu7e6mBQ1BXYyi/XhAER+BYh+vWy67
	P4TUZxZ5xP5w==
X-Received: by 2002:a05:7022:925:b0:119:e569:fba6 with SMTP id a92af1059eb24-1244a7195b4mr14136099c88.21.1768877353611;
        Mon, 19 Jan 2026 18:49:13 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac585a9sm16856206c88.2.2026.01.19.18.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 18:49:13 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
Date: Tue, 20 Jan 2026 10:48:55 +0800
Message-ID: <176887176536.427065.4468747981087466363.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260120024855.iCWV6cvL2IFzEcYXsT6n52e0tE9dl_zwPeC3aHQO5-M@z>

On Thu, 15 Jan 2026 07:18:56 +0800, Guodong Xu wrote:
> The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
> much later than its component extensions zba/zbb/zbs (June 2021). Recent
> updates to the device tree bindings [2] enforce that when all three
> component extensions are present, "b" must also be specified. Related
> discussion can also be found in [1].
> 
> Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
> It is a trivial update, but can help readers reference the correct
> document version. Acked-by Paul Walmsley in v1.
> 
> [...]

Applied to dt/riscv, thanks!

[3/4] riscv: dts: sophgo: sg2044: Add "b" ISA extension
      https://github.com/sophgo/linux/commit/f16ae81b80ca4e721f4c4ed1f28390115f7721eb

Thanks,
Inochi

