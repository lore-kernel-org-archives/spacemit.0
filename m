Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795845619;
	b=lzN65T6OELBLrtEmC0slL0i3dclcicbZ8QBQS8kDMU1uyqueBt+DWYJenRNztujyCgT+
	 kgVHNnqj6hp+fGxHT9PJppzHBQqH40du5watqFTc7RU87MvmTUPZeTw+Ha8l2QQqdFUx1
	 ApRNyiFGBuTiTjCqV9IngYXD7v1nIp8v0WCLU47fOpZwpBjUxmxMXbZgwoydQEgglFleF
	 DWAk+DiI6JnM112EXuoH+MqqP8nSeQqXSz7LQJnQCGMuD9uCKDYL7HrtvriMJlKY1AXoy
	 eItg1+XGe7bTSg/b/8lS/VWravHNQWwFHb2DDsi3aZrskibYnIoncoWOQLZI0Ea/UdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795845619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Yx5muuRug6Ngslv8GFhxTqWkNl+hXZLEfzWI8Nj0s5M=;
	b=3YheOygHfH2wmjIYf4Jxshs4qeniREZXdleBgUWMfb05wFoEvbOfKtbPvFhCqem6ahkH
	 3XLZUlXFCliWxhRRQbnmV9/m6tdOjOV5YolqRwPGIc1dPdwcwxdtjG0hMgsyFVsxxhYtN
	 bU+Y3PfZrK6C7grjFiv7a6hAiP87lmxD5tZQfeXp7LmYp4CpNndH+xhigJ7D9yaL8K6y8
	 18K50dIOly9CQc26YdK6B77vM/C7wmAPkO4EVN10vcyV9l02WmorUR0kL6RGkUN9j7oLl
	 wo2c3nzDQUtitBwHsZSShumHofs6rrGMCB3ICyywZUBvcRCVM61d5T6+x11vLRuZoQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aO+ZAViC;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1056F606A31F
	for <spacemit@lists.linux.dev>; Sat, 28 Nov 2026 06:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1056F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aO+ZAViC
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so2062444eec.0
        for <spacemit@lists.linux.dev>; Fri, 27 Nov 2026 22:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795845618; x=1796450418; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yx5muuRug6Ngslv8GFhxTqWkNl+hXZLEfzWI8Nj0s5M=;
        b=aO+ZAViCZlDo25PWP/OTQbJDp+as+UsCotsPIY5ujEAvOjOzdGWRlCycka0bXc1MYV
         kyXzzZGAhMPtXb5pNu9YybcODDmIc+DUTPGVnrDW/brvIPOwtPa/qHVGguDJ+i2f2TnF
         /1QDkhSIXIOjXAH3uOT9XiWY1MXD+qVcT/6Dm/8tyNbEjrCYK6nKL21UB2+AjtMyAYDC
         J9axhfAs89zD5GRgG673i+C4axdPYnFcipVXF7X8wedYPxeg2gtuLmomVPC/7PXBd2mC
         MxXaz6L4TKfTPTdQKkHiT7R6jEcQ7P45bfMj9VIHDt8/8PKVTHWHyUaqZsndiKc0CZJO
         tGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795845618; x=1796450418;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yx5muuRug6Ngslv8GFhxTqWkNl+hXZLEfzWI8Nj0s5M=;
        b=UWFMGb0X76Cq/paYH5SoWdhpdAPAehWP8UK04DQc6+9QFrmi0N8I+lZfHKKS+LUGcu
         UO2ozRFw/hiamuCN30ScbRNXYhC+gE9PFv06KY89iI5WVse3I/wKkUBvZ6qpT2USLtYY
         YOEkMGPG4K7LKLv7bKJAlQ81H+2sUtB3nI9Cszicic0mm7zOFxaJc7CMKAfI+QKD9+CB
         T43VQ8R34/7GWCJrRnMxOrfGudkge1y4alrZA3Bileo7n6ze97LXcZL310ZnILqeYWvj
         6jUZK2r+yiYbxFH1zK1NtD+DqbiAATzgvoeZH9O7Mo57hrth9cvupJFYSypfy1RdBvm9
         vr3A==
X-Forwarded-Encrypted: i=1; AL+hErFNeVjDRTKcqASIowoliweRuOmn61s4LXLdfcFTL56TSiw1X9pOZlIo8m7hjveHAOu+edfteEwC7g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9dR01EeBzrzq/qe1pVTjHpOKMJLGePyUULi8zmLQLLorYx8H11
	dEThX29rEXO4d20sMpH1BMPYiU4imleYcGeTqRIMifJ/6eMORzxK++jY
X-Gm-Gg: AZFdTZdNPZ069gsChxlR0Dcj/UsEIAwHBuTp2rR0mmr9NKsNAIp4UHyhIbSptybOLuo
	qlhRMY+d1xgOb/DZ+2E/i8BU0VDiKPoNKOnFSGpSoP7P4wptIPF/5Eb72EEMxTu8c1P37ShkSQm
	lkljOr1UVxFMgkNCVuhrteToyotfu+ITdmk5Z4caxYejxpzC3d5ha7fdvDbp3Xdza1+E0pUplpp
	/Ectp+QOHQIMzUv0L86nsNR856BGMMeUd9PBcVNHL0cWKVGKnC9VXs616Nc+tZTz50zPnhWZt5D
	/gukaahaKl8nIjZpP6HrBg33B2meL4igxqZbzWH1oS5kqd+pK0K9ZKPRG2wM2BYMPIGiSubhbCh
	8YOn8pIbv/RjzRBTlr+GT2VvzUT4IjPyUJtG2pZ+fQcOh8btEe/FBwnAi6FY/I+PqgClXhF7aJb
	XXiOH+uHtwn+47vOqidj6DZIpzhJCrnW4emDWmEFI6PpmmmzsT91i7KM7osyyX9rFUKZNrw0lA6
	mEkptajqd7e5jTMdZoWqaKJ9pd02T34TUOhQmk+k/QLl8RGWWcDWiOKonavnxXdmMWAr/acCJtf
	9DRfm8YxAr7+ZmkwtitCZRKyhfsSFQDLxV/7UD5E
X-Received: by 2002:a05:7301:7004:b0:386:c5b8:960b with SMTP id 5a478bee46e88-386c5b89f9emr12711890eec.17.1795845618162;
        Fri, 27 Nov 2026 22:00:18 -0800 (PST)
Received: from localhost ([2403:2c80:17:1e::20a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm92752118eec.4.2026.11.27.22.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:00:17 -0800 (PST)
Date: Sat, 28 Nov 2026 14:00:14 +0800
From: Cody Kang <codykang.hk@gmail.com>
To: Zhi Long <longzhi@gmail.com>
Cc: dri-devel@lists.freedesktop.org, spacemit@lists.linux.dev
Subject: Re: drm/spacemit: K1 DPU and the K3 display series
Message-ID: <1f0150e7-4f59-4b51-9641-774b403e8859@gmail.com>
In-Reply-To: <CAGEQorPo=UkuF-o5+c7exvXzaj4uudM_f7ek_6GnSumMyYngdA@mail.gmail.com>
References: <CAGEQorPo=UkuF-o5+c7exvXzaj4uudM_f7ek_6GnSumMyYngdA@mail.gmail.com>
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

Hi Long Zhi,

Thanks for reaching out.

On Tue, 24 Nov 2026 11:46:55 +0800, Zhi Long wrote:
[...]
> Do you or SpacemiT plan to add the K1 to this driver?

No, I have no plan for the K1. This series covers the K3 only. I
cannot answer for SpacemiT, but from what I know, there are already
people working with SpacemiT on that.

[...]
> 1. Would a K1 variant fit into your driver, for example with a second
>    register map and a second back end next to dpu_saturn_hee.c? In v3 you
>    removed the ops table, so I am not sure which structure you want.

I have no preference to give. The ops table was dropped in v3 after
Thomas Zimmermann's review of v2. That made sense: at this moment I
cannot tell whether those ops would be useful for the K1.

> 2. Is there register documentation for the K1 DPU that can be shared? I
>    took several values from the vendor boot loader without knowing what
>    they mean.

Sorry, I have none to share. It has to come from SpacemiT.

Cody
