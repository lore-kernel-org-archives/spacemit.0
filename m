Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372124;
	b=2HdrQ5b6y1d6ZIrHwomJBwbMoDFxFXWZI/Cv9qbCnF86Vt0pYNoK2RHb8NtPUMlRR0GS
	 6nt9FpTV2MZAkJIHjX1bKHeVzg9hpEcS2ZYrlxEgK8BAI73vwm4Uwz9JGNAImtzM3E2nX
	 /vb7QrYiwIVWJZZwh+5uYSwpHuku4o4GEN7fJjg+NLPgzPQ1GLNkaOeAtc1QEEgO+SDSM
	 5RqL9XvjsF/KqpQgaTWCWJPF9IwDL1EWNzQEWVIdDvHnNbyIsR66xbQ89IRJ+N7Eh+0Pu
	 aIlGtard2jX6O0A777Y9646AwDtHRLN/qAahhfJVQuY9biJE+mSR1Y3SEJunA+HqoRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
	b=MklSrOY3n+6ID7k7L8XFcQG+C4uauzuXBNu57Ng763cW+jSmAixD/BEF/PiYCXSPJGlT
	 ty3D5+nNn8A1DwSab4MmhXMZ4Ehfmbh30eGnFgomje5C0dUJKNUdpICwy/9zCNelk9Jut
	 c7DKjqkp0o48cQeV3s2BeznRTHNwxQW+AS876XrBNgkyeVG78xv0/C/nv/+nQ6e4jRAa/
	 ZvGAhHkmH0pJWfVYnIz5OT3VxM7tVX3igA/QAstDvcDnrC45RmFqXV62AWozLVYPrf4Co
	 MoNF7PnxkOR/kc6Ux5L1NvXWXVLvSRxhYqsArCnbJx0UTa5b8bbabw+DtFQYcFW772A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IBzfQrja;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06E606A321
	for <spacemit@lists.linux.dev>; Wed, 11 Nov 2026 04:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF06E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IBzfQrja
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377157fde7bso20934eec.0
        for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 20:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794372123; x=1794976923; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
        b=IBzfQrjaWkGRI1LhQOPq+JGiSspdNKwMp7XEijNFESHu3TcdaMgmfZSSf1ekIoZidO
         X64x4WPlwvJ+6qKlcOxoZggI1gCjlz3kaJ3py1mXgsE76TsPJgSaB2c/vlD5aFs2iwK7
         9eB7GGVUnNpdPxw4igzMhjrBoFgubWBBl+QYbO9vnJVTW1aylAxJKlPqJGhfgMmgtzDq
         41v0uLbBhdmvKxly81ga+PHWgbG8pJ3vZfHtlV9M43UrZB7xpniHxTX0421VGBNFZz53
         HrU6HKUjBnk+P3VeXiIdZCMHg2XM5k9SQ4BZrPUzz3oN8S54JRlHZJAxy6t5++Bn+Px6
         1W7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372123; x=1794976923;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
        b=X961/OWvPZTzgJuoBVVyTTYi915w6LjHZwMENjOVZ5BXzvTE2cMhzX4GZyFlVP0JqE
         ZxA46x90KBQ39rfnEcl1zc67j3QsvwGLwcJh/+QIWBwZeffBrjc+EfRDmL3AJsBGWbJ6
         cClfZu1BGbp5nHTW9nWnwuXaJZOD4E2AJg3VR8bzar8LI+0KQdcT3Rwn84+tFPS0zDVE
         o0ByXPe7WLiV1aPB5Op/AI8z3xiBKce6djDugy5/r2Q+XnHwWIUuaeQrYomZoR+qNgz9
         bBSQn2OZ+658TzrU8RVLUtvIU+LClaTrwxX7DokjH/6QMgSqbRiUb0pXbjHtgG2/R4yG
         ODfQ==
X-Forwarded-Encrypted: i=1; AL+hErFndZobTIcv4ihf4pVK5KH664iHbm40tbh4hXRmYWhPhgnlRYXOWmLj0/APJeUJLrgNHbe0Jkh83g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9OV5lPIJFNxnl70hZTTy+ZXj/tH/hZO7B0K1foMS7/7vEg0NKB
	ZME15Ou4Xoqfvb1yL2sq2UXYCNbQnlK2q52dyzW/kKbcrynR3MwtYlpf
X-Gm-Gg: AYBFou2eXeL3At9LDiSN5N10R8oCC7WXh5XjT/LPF68XYSaXYLHJ5O+66HxhGacLfeN
	iMq4aNQNhhoZIVpnJHTi7+kdYByFEe4igpN8KA1Ze4BJUo8q+NJ0zd4mBxk7lT2pFFRDHsNObI/
	OAWPmNgEHhQVeyVdHakUMNEvVzvjzmClG1/92aWJodmOz4rqiTaYGUhIX5W8MUHTrTgKWuukauP
	eyQtI57uI/eCRO8OyUOLnx07VOltNo/YPXDAB/9pYR51aBwVuAGMFXhg8nnU6LdvND39/1TMezf
	nsQQDCkAehCDrm/lRlxbp/Jl1iRxEPJx1njVrS5cHEPs48DrK6OhLvfUwOkpt+yPoFNF/y1WQMa
	6EoKpcEEnz4OfLHzQl7VFtUzJ7+mAESOBxYyg94ciTFibyGBaAEDze2jLns60eqojctlpIAdMp3
	bPmm/1gP/g+1SC1uJ1B3d/qeeRutK8L6K/ZlLoLyF23rk8AnsyJdtSD9oSoUNip4GpoGVUlX5vm
	h/eziZLVUfdEkjX6IEg4qff7LkYJ8P7HzIPzlfkBMpc+c1U9T9iu9X5bdiYJXq3sm2fecJcRK29
	iPwDvNIgxgd0O8Ux+Z7+XAGe
X-Received: by 2002:a05:7301:4184:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-37685d753c3mr2904495eec.20.1794372122835;
        Tue, 10 Nov 2026 20:42:02 -0800 (PST)
Received: from localhost ([2403:2c80:6::10d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm11023535eec.12.2026.11.10.20.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:42:02 -0800 (PST)
Date: Wed, 11 Nov 2026 12:41:58 +0800
Message-ID: <531e628a379b6733632a25d998337d77.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Sarah Emery <sarah.emery@canonical.com>
Cc: airlied@gmail.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bmasney@redhat.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dlan@kernel.org, docular.xu@gmail.com, dri-devel@lists.freedesktop.org,
 heylenay@4d2.org, krzk+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-riscv@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 me@ziyao.cc, mripard@kernel.org, mturquette@baylibre.com,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, palmer@dabbelt.com,
 pjw@kernel.org, robh@kernel.org, sboyd@kernel.org, simona@ffwll.ch,
 spacemit@lists.linux.dev, tzimmermann@suse.de, u.kleine-koenig@baylibre.com,
 vkoul@kernel.org
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
References: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
 <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
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

Hi Sarah,

On Tue, 10 Nov 2026 18:02:42 +0100, Sarah Emery wrote:
[...]
> I'm sending this here in the hope that it will be useful for a future 
> revision.
> Is there a v3 in preparation?

Thank you for the fix, and yes, a v3 is on the way. I am working on it
with a friend, and it may be posted by him rather than by me.

I am glad you brought this up here on the list. I had already noticed
your work: the series, with your two fixes on top, has been running in
the Ubuntu 26.10 release on the SpacemiT K3 boards.

I would be honoured to have your Tested-by once v3 is out. Thanks
again, and thanks to the Canonical team.

Cody
