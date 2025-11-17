Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76FD32E12A
	for <spacemit@lists.linux.dev>; Mon, 17 Nov 2025 17:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399569; cv=none; b=QLBqoj8UFjHja1fEi3dtoRjYM3yLO1xoqNPGUvu/2iCOZoiV0bN3MJyFwB2TIA4PslDcr18phDvOvgNBLKDlYH6CxZLkI7tkrNtpAD56/d0Uoydqz3HcVgaJdEGxRRI7ch6gB8vqbqqRWWZDWxe/s1p6RiLVSBG4XHSXF9PJDug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399569; c=relaxed/simple;
	bh=nmhM4LSVMsUor5QeIBHpH3224iyADx1BLXHEi4pE9A8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3H0F7RJcZ6vqRQ354X/V8nFURbPQNREvVkafXOF6Vz68l/F0Ax647kyLpeYgNFH4oTwmBvsU7u+MyQOPuY16uNpCKmp31mxWOXJu5tkI+uAUaFG7RyW3UNqGp7mLmSzeDv+knKDDAnvxVMDOg+AvegkkDBTZQuITSudsjCQl+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=kz72YaTK; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="kz72YaTK"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-4336f8e97c3so35374685ab.3
        for <spacemit@lists.linux.dev>; Mon, 17 Nov 2025 09:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763399565; x=1764004365; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UVyQ1lgChGCDzR3SsqjIRgL3e2y5+BZfD9Zpt6v7tGs=;
        b=kz72YaTK1hJFhPWQlVPWRt7a3DGMaM09+VMXfzXO+cb96bo/uRtnFk6IPGKByCZqMl
         dVIP0myM5ZElEAHVO1yFcx1ZarEDyLjCr1r5A6E9BB9/K0XC6R2Y2sQQZKAt4GvtYpVh
         4jXn4jviewls03v9w/acEa6euo+nmi/k8BRAvXB9Fd6qmnr2lcQhSbLAVpICFC8wq4EV
         tIKo31PIzkXUggxQU/EvefmRN6Y8SjeSqVTDD6PGY6iq3J+jp+Yn5qCm6AtyiWt9H2iz
         MABCdIT2Qms5dSXw5jzVdYQRPgYovwlT2jORr0llwMJYRlGEWDfv9VQPzEXnoNRX8E1K
         scFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763399565; x=1764004365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVyQ1lgChGCDzR3SsqjIRgL3e2y5+BZfD9Zpt6v7tGs=;
        b=DD1ERXuRDpF3v10pTAFBoUBUuRTbeBQHbLyWqO0AyWdapwMKsEprC7Lrk2qBvUdRlE
         N3OaIfdK3nh9IIcHJ82GICDUzX2IlQDnRbMciPwaKNnH4moF6B9Eh3uYrhJHQ5Ya3l+0
         lUtZs0yOmbnDcPN3OTDWoX6ha8KGewB5kJ0see8mO4aVBZkNUfYRNjesFGLZImttzsiJ
         Syx1aWJ5DZxCV58N98sP3RSAedyKWGcW5PXSL0cjTLxKdpg2x6JWBVEFocu6g3UX0BOY
         BBmijDqVGxjuNELjtTw4kEQWelhDO8ZRMW2Zf9HzdKRAD9niinKx2l0YF7ly+R7JERV6
         wbTw==
X-Forwarded-Encrypted: i=1; AJvYcCVGlMbaGUkRc+j0wxb6HIwgUqbjQtRUC1XGT44XE82Zkk5GlU5PTLrYl/WYz0EJqDCqLg7tzLYapw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh75rwQAR6Kn6I056P6rmrZ+fi+g/6706ptl/39Jn7ZLQq7o13
	3Eu4nAG4SWkCX+rSBcn50B5CMxSbex7pNaJdoaEHhjghC4A3gTdpV/9UMdzq4+qhCXA=
X-Gm-Gg: ASbGncsSpkOZ4D6VjheRHTZi8Qz+iMn+spF+SpcoTEN/dbqSJ0/x1qWWGdJ7HiODPoA
	+YsvXAieJ8Lmp3hiop4GRaH9uH6xzN1T0tRxpxFJwGyDfW5mRfZO+morOH5HhI7GQY9xX3ZKj4V
	bwTPmN0kIsHSn+fceKQfbZzegLrUBG814OVuOxR6vNcCnYnQJPUinC6tW80WDVl9i/BquDAchAK
	n9AvMt7rXASF8Q+Kat2AgsKBa+VCL+X+z0/UN71QvqPKhGlEExvdxiSimkQCloteLZ88/7eFQr1
	EvswIAW6U+Xdlnhz14UogX1mvHV9/E06av/yHz3YSiFNoMBIstqoEkWvHEXOtEUmSlsXDXhzWR3
	Gh6ycksXDSaZVnSIRMHXi5NeCtd75ak8V06VXRztKsIEkQH9EZ7AqsIMkHhvErS24EFqEJR08nl
	YMM1yWsiFvs8twFHSIIUOv4qoELIlK9krMUdlPcpFPGsMZ+RNFr+pAtVnw6t0g
X-Google-Smtp-Source: AGHT+IFGKqdRJLV9RQOyvs5MvCac0JQUqvPl4j+mCywXmiQhs/UBqawUJsZSrZzGsMyRTHumxUBE2g==
X-Received: by 2002:a05:6638:4b8b:b0:5b7:1ebd:4d11 with SMTP id 8926c6da1cb9f-5b7c9c45d2bmr9122365173.3.1763399564687;
        Mon, 17 Nov 2025 09:12:44 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7bd24d5e9sm4708226173.3.2025.11.17.09.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 09:12:44 -0800 (PST)
Message-ID: <b9769b9f-cbc4-459f-911e-f29f848b6ce7@riscstar.com>
Date: Mon, 17 Nov 2025 11:12:41 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: Jason Montleon <jmontleo@redhat.com>
Cc: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, ziyao@disroot.org, aurelien@aurel32.net,
 johannes@erdfelt.com, mayank.rana@oss.qualcomm.com,
 qiang.yu@oss.qualcomm.com, shradha.t@samsung.com, inochiama@gmail.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com,
 thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251113214540.2623070-1-elder@riscstar.com>
 <CAJD_bP+AjhNCB6kCeKdnXERjP9j8dhbCejnS1OVmFf_VShti5Q@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAJD_bP+AjhNCB6kCeKdnXERjP9j8dhbCejnS1OVmFf_VShti5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/14/25 10:21 PM, Jason Montleon wrote:
> On Thu, Nov 13, 2025 at 4:45 PM Alex Elder <elder@riscstar.com> wrote:
>>
>> This series introduces a PHY driver and a PCIe driver to support PCIe
>> on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
>> Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
>> PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
>> one PCIe lane, and the other two ports each have two lanes.  All PCIe
>> ports operate at 5 GT/second.
>>
>> The PCIe PHYs must be configured using a value that can only be
>> determined using the combo PHY, operating in PCIe mode.  To allow
>> that PHY to be used for USB, the needed calibration step is performed
>> by the PHY driver automatically at probe time.  Once this step is done,
>> the PHY can be used for either PCIe or USB.
>>
>> The driver supports 256 MSIs, and initially does not support PCI INTx
>> interrupts.  The hardware does not support MSI-X.
>>
>> Version 6 of this series addresses a few comments from Christophe
>> Jaillet, and improves a workaround that disables ASPM L1.  The two
>> people who had reported errors on earlier versions of this code have
>> confirmed their NVMe devices now work when configured with the default
>> RISC-V kernel configuration.
> 
> I successfully tested this patchset on a Banana Pi F3 and also a
> Milk-V M1 Jupiter by making the same additions to k1-milkv-jupiter.dts
> as were made to k1-bananapi-f3.dts.
> I no longer have problems with NVME devices like I did when I tried v3 and v4.
> 
> Tested-by: Jason Montleon <jmontleo@redhat.com>

Thank you very much for testing this.  Your Tested-by is included
in Mani's commit.

					-Alex
