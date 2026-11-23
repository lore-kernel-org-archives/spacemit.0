Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433167;
	b=YCea53hP0bs0+l3fm8SEUAfbUGbl59CbwMMd69ZxlZ5Eaq5Kav2mS0IpfX4UjPIODHr1
	 x4pqSJ/974pE4PgOYLbH5RfF+FZNw6bS8Fzk30T7eGECeUBojYVQSUDb0bXMrYt+KXcJH
	 xe1cLix8ABDXwwANanyuw/G9b9IBh/Pcu2uK6eM9MdGwUs5a0PQkC+5SVkxHQvOHP+0yL
	 wFUxaLWWJDz57aepIxbn2WWSiiJsV3lUESDyq7T896AJdZGpS2Ayi88dXnL/aPosK+qew
	 4SMcfOGYBnjJkGOuT+PIc444KLhz66eNz4/R5DfbhAxeUX8LcWXmBkjOxWnPJU90/kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
	b=heXDHmphX6fNqehIF0lVxiPQEkFOyT1Mt8XDWzxmDkLjKSRQOFQUBCdkZiwKMQBzxu76
	 Tl4srZZFgER829z0EQfjMT6We5ztIbJHujBPuykoegII7sNC0IxvjDlDlq91mPNeLj4Ui
	 eZiy7WdWiMuNvEROwVQCjzmU2vDqBsbp5pkvPgrSHQGcoPQdkpZD4n6V5wyhnGN82qVeM
	 J/nvPUxJUWLfeftbm50cBwKdwvoGafAQNEGurLcsrPUXyuW7Ftn3okYZwId3L4Y53rnyv
	 QFF8jF17MfMvWat3/XTgU9RZnX2OGehhrPBPPY5WqlzX9RuOXauh1rnh+YjHGvliFYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q29eLR11;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB439606A321
	for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 11:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB439606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q29eLR11
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so1736493a91.0
        for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 03:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433166; x=1796037966; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
        b=Q29eLR11C1QNytvIk1fX3mdWAVbdgKC1KUzLQ6VcvsnQWZa1NxZS7ceoD+mj1fSrcb
         hJv9JfOswmAJmganKwNUU2SftMm9sMO13UYXVXytZaYItIedVgiVr+UBUu5CDZ9Jfij9
         cmamd1G23CWtjTVMSxwqToTZTeveegJwALXhOcKhvGw1jftZhZrjOoh6fP+NvI27qrk9
         J9dyvYd9ZvVwd3yjeH132VC5JA7BEhwXAzu/QxZqGALUjWVRViSvDF9GfyJ7/RidMftO
         NPSmTXXWnDiqMESaMbKW4G1xtJ6RFkNHlOmyLWHQEUksddaePNCGetRt4lYfkISEf+kW
         Bb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433166; x=1796037966;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
        b=Pz+HqQDgYHHpO5a94VhfxqOAIQlZcLariz7c4n4Hkw0Aw1pA45qFKeYqfYQt8X/0xu
         k2Rptt7AH16xARFstV07oJPNxmhx0ngRh0dV7Rx2tYlPnpVvNzjxH9uPx5fhpfmCG//9
         6zLVD13iXxLbV/bgLDvFcf0S/V3AUY8R3zIVN85n055MfRWoT8RLOQ9NcSIYQoxLywAf
         J08gz08GXtHKhdqPRHFw9u4LZ8BEMRXC7bbLdSsON3H5P4xCSkhNXzLaM/9NvmThwLbj
         /TSWwOryhpB+vCCasrNBSGqvzdx0rhPtcSMJ5HaObgilFk8jiC2c8h2z0dFEXx2E6IZD
         z1qQ==
X-Forwarded-Encrypted: i=1; AL+hErGC+nLdfIF04/C7HVuNNCSxKc9EIDemUp+HGBimbeTtWX8SJJWB7fge8NztdhRXQOyql0RNKA8Wkw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9XG4BiELsK4Ar3sFQHA0DrAbBvVQWRUfuqgO7dJ7xcbKPNdIZz
	4WgEHUlXQz5vKDDwM6cJ+aSWE/bi6VJ/Gi57HdMy2YOimR2r/0N78EKR
X-Gm-Gg: AZFdTZel6P2Isxsv9h16y1KgjywS959WHqolybrtU8p+0nozmILlTG9bYmV0a8SIG36
	+gwSjCyKGHZfnP5NBzLlpt+6+oR+QLD3uJ9LMWZqXXdx0rj3QEcOB+Q6DWrWQ8wlvwR58bQvzgp
	PhMCnscB92T/Awc8AbcX0/lnhnjZGh+LoXpm+9Z3s5mbFhqv/44yXROibHyhjVXs8G2HdCJLf9e
	prA6t9gG7oj0A0TOE2UL9ikomsqMGeF7vyL0EQwdFQhgy96zmz9b8tuxFljT/NuEh/IQTNGb0Qk
	q6E8adEn+IjCM3ZrecbGo65gTS82RbVCZ/HsdOBs8hZ7/OtxdBLJrgK/fWtRdvv8RPG6kuRbSaa
	Jmtb8rnxj9chUABIw4LkmGUWCLlpNKtc6V/6EgwMpi42MGXOE410HA9ASWFBm0ufsILPLYsv6jN
	2bjJ4dH4Cl0I2W+g6pOtCX9vFJVwEMbqXz7nEU2PNuqHbZoOQPpBRonljA6zDz5CwADQBPjXPmD
	0JMi0qrAW6ux3WWlKf5pXEYPFL47VYhYLlhhrdCrgSVZqChzwNGzLXdpdjDWi3fJWxEUAXVd6vS
	d+BUxDT/kxnY3MhFODBXVD4RwKUbhya6qA0=
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr10517519a91.52.1795433165943;
        Mon, 23 Nov 2026 03:26:05 -0800 (PST)
Received: from localhost ([2403:2c80:6::10a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17449770a91.11.2026.11.23.03.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:26:05 -0800 (PST)
Date: Mon, 23 Nov 2026 19:26:02 +0800
Message-ID: <f5c6f44bfb6040289653cdc079b1cb2a.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Ze Huang <ze.huang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 10/17] drm/spacemit: add Saturn DPU KMS pipeline
In-Reply-To: <awPxPHpr4NYxqdmf@houat>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-10-ec419e8e96b8@gmail.com> <awPxPHpr4NYxqdmf@houat>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Maxime,

On Mon, 23 Nov 2026 08:55:40 +0100, Maxime Ripard wrote:
> On Sat, Nov 21, 2026 at 03:40:49PM +0800, Cody Kang via B4 Relay wrote:
> > +static int spacemit_drm_master_bind(struct device *dev)
[...]
> > +	drm_mode_config_reset(drm);
>
> You need to use drm_mode_config_create_initial_state().

Thanks for the review. Will fix in v4.

Cody
