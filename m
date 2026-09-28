Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830A1499F3A
	for <spacemit@lists.linux.dev>; Mon, 28 Sep 2026 23:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637567; cv=none; b=W9sLiEkgjUuyjgeT3cvXYVz0NQ/pwCG41UbfPr5+OHfLHHDPoEVmrBW2tWnjxYU5b6BDcrWoKxv16nNWmI4p8BGqprfvNwSuV2Nx9lyJabILK7uLH8MueOqxVPy2kA5TmPl/2ejyr7J/UUYsCT6VBbEwaf738sJrxFKcbydjs18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637567; c=relaxed/simple;
	bh=FCGF26dCddhrQg7vYYo0pTLzkYH3qozJaaCKhDXyBpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=TzfpATQ/q4cP7IBl9ioWw5j73qmU8GVvluHiYNnxT1psnDKBtGpLqsuZrV23sqRIk4G8jJFdkvSuPdrmUaJZxMA2RsfbW5ZOc6DxEohdPblasWx/4qmVOOJZGb+Y+rvl5fRVYPqnbeTB469GrQ/OsbRMIZQmJSsCZeHgDNfHy0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GVZi/PVG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GVZi/PVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1L37AvZaZESgc3kaNIXv7EdbpEkOBgUu914+Tx8mGHA=;
	b=GVZi/PVGuRFDZxyDFR62z0gaxDN/6EOIebe9LIYCDaFL1f8u9oggfT8ncnih+fGC9HNFSP
	MnuKyRZqsPc736wgWJGXMU0Db/MbTtas3rC9rgLIcTy9xFFwB/X2uYNi6mQzozQnS3BvzR
	3KaLd7TJXJ2skiI+t9Xq7X2eCOZMFdM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-Q-Vratd3M3GuPBN9kApj5Q-1; Mon, 28 Sep 2026 19:19:13 -0400
X-MC-Unique: Q-Vratd3M3GuPBN9kApj5Q-1
X-Mimecast-MFC-AGG-ID: Q-Vratd3M3GuPBN9kApj5Q_1790637553
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-88322409239so52402517b3.1
        for <spacemit@lists.linux.dev>; Mon, 28 Sep 2026 16:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637553; x=1791242353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1L37AvZaZESgc3kaNIXv7EdbpEkOBgUu914+Tx8mGHA=;
        b=1YR8xoNx4fAl4i4B9k9bD0jZOlh/XStzu53KFj37ZmoWCp42FQYX7WB3kz0k38yg9s
         h4KlicM1Qy9Kb/MAyiIMi3OBCnpsxPxUusnqpm8k4cS8fItH/JRpm5oFr+LJZw/VCFRO
         KUAQWKE3FOBMamgPYjnEdGtjF/WCryNvGdMSSj/xeC+7jle4YVqVa87qbgtAPQ1TD3i+
         oTi5omA7Ed2E69xlb7ytxZNmTv9gTlcHiiuMRhnmuJJ1M2Cvv0I7DIghO3euyLOvojpL
         pVtqhMgiwQhSEjnMBXsznUXvc3I9EGfjMwJEpCoZw+kv6qNZx/hulUCvihdnORDjyZ9w
         5W6A==
X-Forwarded-Encrypted: i=1; AKwUvBwuA8ME1O1/go5kJPZevI0YgBhRYUQA5H0/9CAc+BOhB+olQuaE8rBl+hW3mPVfJbaBfkMv1F5Sag==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ6yYfKIcGgc4AqIso5nbxwAywAKOPgwCSLa5csysSxl4c0Le8N
	p//uMull+TkpLre2Wfaxf8QyVAq+Q6RJtnVsB1gqr6/lSPIURrxsxA5PaajN1KucOCPmjee2b/h
	RGj755gKA/ODx0utmPgmoiYIDYW6YNGpTHHYSnDEOxwDf2TC1hEkn6WVyWKwu
X-Gm-Gg: AYBFou1YjEDsqDf64ubSFjJjJkCCn+j/rzDhQzPCVILoVAbquhpZYXBqReuOx5hflO8
	HhhrKAWzGTcBTL6GEr/IxqKmIzolU9oXbMdl0nnb7Qi67/j31WXs2fjJpCRO/QmjcDqobGRZZ0h
	vUDNFWxfKjuXldaBx0eCiRzZ0EBkcrT7I5OrHZe2dzOqELWmldNdIBvUl+tXzY+1YD1wUOxgqvt
	jjEgEk0wI8TL9IOQjxF5Su54/rbTXEz46NmwTo0tnxvzeMoJ+PuWbyfk8+IzCwnmmipVRsp5fB0
	dh5lJX5sWXY/Gq0+hY+DZWITSZz1eWyMTxFwLqEu95UTEV7oB+JsXA==
X-Received: by 2002:a05:690c:e3c9:b0:8a9:9a2e:e34f with SMTP id 00721157ae682-8a99a2eeef4mr35038827b3.13.1790637552699;
        Mon, 28 Sep 2026 16:19:12 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c9:b0:8a9:9a2e:e34f with SMTP id 00721157ae682-8a99a2eeef4mr35038647b3.13.1790637552245;
        Mon, 28 Sep 2026 16:19:12 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:10 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 0/4] riscv: dts: spacemit: Enable USB and PCIe for K3 CoM260
Date: Mon, 28 Sep 2026 19:18:03 -0400
Message-ID: <20260928231807.1757995-1-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Wo_MG4bR46vBYp5dZe7reGHiqN3IBat1489NC090BGs_1790637553
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This patchset enables USB 2.0, USB 3.0, PCIe, and rfkill for the K3
CoM260 Dev Kit board. This board has 4x USB 3.0 Type-A ports and three
M.2 slots which may be used for two NVMe drives, Wi-Fi, and Bluetooth.

The USB Type-C DRD port is not enabled here because the necessary
drivers have not yet been posted.

This is based on spacemit/dt-for-next. The USB patch depends on [1] and
the PCIe patch depends on [2], which in turn depends on [3] and [4].

[1] https://lore.kernel.org/spacemit/20260928205012.3689405-1-aurelien@aurel32.net/
[2] https://lore.kernel.org/spacemit/20260727094726.890179-1-inochiama@gmail.com/
[3] https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/
[4] https://lore.kernel.org/spacemit/20260923015016.64069-1-inochiama@gmail.com/

James Morris (1):
  riscv: dts: spacemit: k3-com260: keep dldo4 enabled

Jennifer Berringer (3):
  riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
  riscv: dts: spacemit: k3-com260-ifx: Add PCIe nodes
  riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes

 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 122 ++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi   |   1 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  |  33 +++++
 3 files changed, 156 insertions(+)


base-commit: 4947ee60bf48caddf5caefc08dbbc84d09fbbc6b
prerequisite-message-id: <20260727094726.890179-1-inochiama@gmail.com>
-- 
2.55.0

