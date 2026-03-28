Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E891F8691
	for <spacemit@lists.linux.dev>; Sat, 28 Mar 2026 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691925; cv=none; b=DFjYvQy/boIx7EG5saqy4QBCwjg/3xH0QjMdRAEZSwjjCdAUqwpB6Ij+1F0Onef/pg0umpBcXAxyM0DiDhTG90xO+htgK2jXZxY2ii8Xr/Bn59iAnxvmcYSbuj4DjFW4kKb49ENqQmjiJpzXW5T7K2ung7T+VZ4E3rRsh7Hi9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691925; c=relaxed/simple;
	bh=b3JlCC4tL2Tz58FKwg2YL+SyAtOwXrfA/gsgi5WMt/A=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=fEGhVsWerYfux3VahPkYYPtUJbsGeRyH15mf1zy7gFaiiN0xAlE9ynzDPv38qffWz6AUpAS8qKklG6QnE7/3k/gv30bDPHsbET/z9JD4tk+y4GeQcImqUaQbD+lgzIbX8x/QqLpeuMtpEtkohUIBP0/oRqSwoCiO/pmIbBCexog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKQcmYi2; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKQcmYi2"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-126ea4e9694so3086629c88.1
        for <spacemit@lists.linux.dev>; Sat, 28 Mar 2026 02:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691923; x=1775296723; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPZRgmhGXKGLV4+N3md+ZOqvfZ5oB0BV4k3AKJQbhLw=;
        b=dKQcmYi2KxEZTksLCXJkIJ8SsFMlp9eSEL+F8T03YfIt30BojZBRwa/pgvsu0DK1uU
         QQpzHoMm7tWxajSYosd8LV3CxiL20qUfes4ETDyD9AwSoGaXj27ribj6Q2SvW8qmtKkk
         EE5gmgPdrQvn2AGU/LxJYVy17mzftITV401cAbIulacmnUgeAUEpPh7hlhGubC1KSica
         2hnF2ZdSz06GcKLAkMVb5hYAZDpq5mmrOwuYDPmc1an9sZabT7J539yXtVhGYMPovFD0
         m8T4OEg7ZQSb7BE2mMirUVtpbLvb7r8IbM1xUyCeghaqYKR+mZshm5sE+Y5aUwqf7LRP
         gbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691923; x=1775296723;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPZRgmhGXKGLV4+N3md+ZOqvfZ5oB0BV4k3AKJQbhLw=;
        b=DLZMwGhUxgUZqnofDnuMTtiRZCSxwofunrYrRb/WmEN7V8ggFCqFjY03LwmtxllTT0
         MWEwzACaqKH1OgAbXM5rX5Pd+j7bvHeEsHfm99KKrEOTcM2HJFAlBCUhpE7pt/yr0v9V
         cvuFAG5XB3W9mDVIdSFqFvDlyjygQAKzvxEE5C2oHi5v9EmPO1ecP617NXdRCkCySCKQ
         AHkUuoD+IijkeO9WuqxjCzE+/J3SpbrI+yfmisFqUHYypF5Zz62jDy54r/U7mcBK5FMc
         GQ6rTUHDVLELLqe71rjJDAGK5HDvzEITBWzfyZQ9dKd7GFIr/P5AKPiSZL/Q9GBMLQvm
         S5VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjSGa7Km15ZbHrIVBd1lSebNyd51+hnUgu4wP6dn5aW7jGyoOGAgc10LJc6tazbuun4SkIjUBklA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoeOL4TUlSt/KWv3rvGIZz4ke07tofUW8i+J5TU4Olb3cgN0Fa
	hwu5BzOdb3zoZHy6jKOFIJnVkWO3rhyDQmVePQ8TgK3l0MwadmwZUamG
X-Gm-Gg: ATEYQzzpo6AGMDU9dDZ9HBQ9fCp4/jfjY6qqzWeQTGyzBqZ1h3UE5PRZ71iUY6yxwGn
	EFTxFiVI2JZi1Xn1p1bkV0lS5YqiPAw099l7lLQwenMNmgHwR2F/HAnS1wdPR3u9/iThUXEnoCd
	s7klibk7J6H213uifqVjZv5ysOGfR19tGuho49c4pXiuXDHREkREgHwane1xP29QZx8NqbHPm/W
	MQjAAVOj5sUXJe3x7qTV9scCfUjJ8tzaJaffBP0VxC8KQMTvkC/YIJ0HkWwMmYV2kClVvn6udkM
	m6kRHhjBR44HCGX9NvtFTNhu1U0eZfe1HJVgMq1TJh+Auj2DATFwUQfBQvqLgU9wBQj5xiqBbfY
	XIww4HCnx+zNGxPfZlHg2lsJLbhfsgN62NyKj76vYyvzb8mmzAUbWjOybyP/x13YDkTyQWPVuqN
	4pvMwSkYioDGzdeffp2/xGO6XDj+Y=
X-Received: by 2002:a05:7022:b98:b0:127:33e0:ea33 with SMTP id a92af1059eb24-12ab28e4da2mr3105409c88.22.1774691922629;
        Sat, 28 Mar 2026 02:58:42 -0700 (PDT)
Received: from localhost ([104.28.227.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c79722e0sm1866524eec.31.2026.03.28.02.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:58:42 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 17:58:39 +0800
Message-Id: <DHEBS4TLJV5W.3AO0UY2JXWAFE@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>, "liyeshan"
 <yeshan.li@spacemit.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 request definitions
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-3-ca94ca7bb595@linux.spacemit.com>
 <20260327-granite-giraffe-of-infinity-ff49a3@quoll>
In-Reply-To: <20260327-granite-giraffe-of-infinity-ff49a3@quoll>

On Fri Mar 27, 2026 at 3:30 PM CST, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 04:17:18PM +0800, Troy Mitchell wrote:
>> From: liyeshan <yeshan.li@spacemit.com>
>>=20
>> Add device tree binding header for SpacemiT k3 DMA request numbers. This
>
> Why?
The DMA request mappings are hardware-hardwired and differ between the K1 a=
nd K3 SoCs.
Therefore, separate header files are required to define these unique consta=
nts for each
platform to ensure correct DMA channel allocation in the device tree.
>
>> defines the DMA request mapping for non-secure peripherals including UAR=
T,
>> I2C, SSP/SPI, CAN, and QSPI.
>>=20
>> Signed-off-by: liyeshan <yeshan.li@spacemit.com>
>
> Name looks close to login name?
I will contact her and confirm.
>
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  include/dt-bindings/dma/k3-pdma.h | 83 ++++++++++++++++++++++++++++++++=
+++++++
>
> I am already confused what is happening in this patchset - so which
> device are you adding? K1 or K3?
Aside from this K1-related patch, the rest of the series focuses on adding =
support for
the K3 SoC. I included the K1 header because I noticed it was missing in th=
e upstream
tree while working on the K3 support.

It seems my attempt to 'clean up' K1 while adding K3 has caused unnecessary=
 confusion.
Would you prefer me to remove the K1 patch from this series and submit it a=
s a separate
patch?

                                    - Troy
